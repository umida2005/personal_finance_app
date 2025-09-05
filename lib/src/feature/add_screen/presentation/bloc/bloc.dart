import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/feature/add_screen/data/add_expense_data.dart';
import 'package:personal_finance_app/src/feature/add_screen/domain/add_screen_repository.dart';
import 'event.dart';
import 'state.dart';

class AddExpenseScreenBloc extends Bloc<AddExpenseScreenEvent, AddExpenseScreenState> {
  final ExpenseRepository _repository;

  AddExpenseScreenBloc(this._repository) : super(AddExpenseScreenState(date: DateTime.now())) {
    on<InitializeExpense>(_onInitializeExpense);
    on<ChangeCategory>(_onChangeCategory);
    on<ChangeAmount>(_onChangeAmount);
    on<ChangeNote>(_onChangeNote);
    on<ChangeDate>(_onChangeDate);
    on<SubmitExpense>(_onSubmitExpense);
  }

  void _onInitializeExpense(InitializeExpense event, Emitter<AddExpenseScreenState> emit) {
    print('InitializeExpense eventi: ${event.expense}');
    if (event.expense != null) {
      emit(state.copyWith(
        category: event.expense!.category,
        amount: event.expense!.amount.toString(),
        note: event.expense!.note,
        date: event.expense!.date,
        expenseId: event.expense!.id,
      ));
    }
  }

  void _onChangeCategory(ChangeCategory event, Emitter<AddExpenseScreenState> emit) {
    print('Category o\'zgardi: ${event.category}');
    emit(state.copyWith(category: event.category));
  }

  void _onChangeAmount(ChangeAmount event, Emitter<AddExpenseScreenState> emit) {
    print('Amount o\'zgardi: ${event.amount}');
    emit(state.copyWith(amount: event.amount));
  }

  void _onChangeNote(ChangeNote event, Emitter<AddExpenseScreenState> emit) {
    print('Note o\'zgardi: ${event.note}');
    emit(state.copyWith(note: event.note));
  }

  void _onChangeDate(ChangeDate event, Emitter<AddExpenseScreenState> emit) {
    print('Date o\'zgardi: ${event.date}');
    emit(state.copyWith(date: event.date));
  }

  Future<void> _onSubmitExpense(SubmitExpense event, Emitter<AddExpenseScreenState> emit) async {
    print('=== SUBMIT EXPENSE BOSHLANDI ===');
    print('Joriy state: category=${state.category}, amount=${state.amount}, note=${state.note}');

    // Validatsiya
    if (state.amount.isEmpty) {
      print('Validatsiya xatosi: Amount bo\'sh');
      emit(state.copyWith(
        status: AddExpenseStatus.failure,
        errorMessage: "Iltimos, summani kiriting",
      ));
      return;
    }

    final amountValue = double.tryParse(state.amount);
    if (amountValue == null || amountValue <= 0) {
      print('Validatsiya xatosi: Noto\'g\'ri amount: ${state.amount}');
      emit(state.copyWith(
        status: AddExpenseStatus.failure,
        errorMessage: "Noto'g'ri summa formati",
      ));
      return;
    }

    print('Validatsiya muvaffaqiyatli, loading holatiga o\'tilyapti');
    emit(state.copyWith(status: AddExpenseStatus.loading));

    try {
      final expense = Expense(
        id: state.expenseId ?? DateTime.now().millisecondsSinceEpoch.toString(),
        category: state.category,
        amount: amountValue,
        note: state.note,
        date: state.date,
      );

      print('Expense yaratildi: ${expense.toMap()}');

      if (state.expenseId != null) {
        print('Update rejimi...');
        // await _repository.updateExpense(expense);
      } else {
        print('Add rejimi...');
        await _repository.addExpense(expense); // TO'G'RI METOD NOMI
      }

      print('=== MUVAFFAQIYATLI YAKUNLANDI ===');
      emit(state.copyWith(status: AddExpenseStatus.success));

    } catch (e) {
      print('=== XATOLIK YUZ BERDI ===');
      print('Xatolik tafsilotlari: $e');
      emit(state.copyWith(
        status: AddExpenseStatus.failure,
        errorMessage: "Xarajatni saqlash mumkin emas: ${e.toString()}",
      ));
    }
  }
}