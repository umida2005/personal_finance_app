import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/feature/add_screen/domain/add_screen_repository.dart';
import 'package:personal_finance_app/src/shared/data/app_shared_prefs.dart';

import 'event.dart';
import 'state.dart';
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final ExpenseRepository _repository;
  StreamSubscription? _expensesSubscription;

  MainScreenBloc(this._repository) : super(MainScreenState()) {
    on<LoadExpenseList>(_onLoadExpenseList);
    on<ExpensesUpdated>(_onExpensesUpdated);
  }

  Future<void> _onLoadExpenseList(
      LoadExpenseList event,
      Emitter<MainScreenState> emit,
      ) async {
    emit(state.copyWith(status: MainScreenStatus.loading));

    await _expensesSubscription?.cancel();

    _expensesSubscription = _repository.getExpenses().listen(
          (expenses) {
        add(ExpensesUpdated(expenses));
        print("Heeyyyyyy main screen expense list state ${state.expense}");
      },

      onError: (error) {
        add(ExpensesUpdated([], error: error.toString()));
      },
    );
  }

  void _onExpensesUpdated(
      ExpensesUpdated event,
      Emitter<MainScreenState> emit,
      ) {

    if (event.error != null) {
      emit(state.copyWith(
        status: MainScreenStatus.failure,
        error: event.error,
      ));
    } else {
      emit(state.copyWith(
        expense: event.expenses,
        status: MainScreenStatus.success,
        error: null,
      ));
    }
  }

  @override
  Future<void> close() {
    _expensesSubscription?.cancel();
    return super.close();
  }
}