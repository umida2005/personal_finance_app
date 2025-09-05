import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/feature/add_screen/data/add_expense_data.dart';
import 'package:personal_finance_app/src/feature/add_screen/domain/add_screen_repository.dart';

import 'bloc/bloc.dart';
import 'bloc/event.dart';

class AddExpenseScreenWrapper extends StatelessWidget {
  final Widget child;
  final Expense? expense;

  const AddExpenseScreenWrapper({
    super.key,
    required this.child,
    this.expense
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddExpenseScreenBloc>(
      create: (_) => AddExpenseScreenBloc(GetIt.I.get<ExpenseRepository>())
        ..add(InitializeExpense(expense)),
      child: child,
    );
  }
}