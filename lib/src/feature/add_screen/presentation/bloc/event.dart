

import 'package:personal_finance_app/src/feature/add_screen/data/add_expense_data.dart';

abstract class AddExpenseScreenEvent {
  const AddExpenseScreenEvent();
}

class InitializeExpense extends AddExpenseScreenEvent {
  final Expense? expense;

  const InitializeExpense(this.expense);
}

class ChangeCategory extends AddExpenseScreenEvent {
  final String category;

  const ChangeCategory(this.category);
}

class ChangeAmount extends AddExpenseScreenEvent {
  final String amount;

  const ChangeAmount(this.amount);
}

class ChangeNote extends AddExpenseScreenEvent {
  final String note;

  const ChangeNote(this.note);
}

class ChangeDate extends AddExpenseScreenEvent {
  final DateTime date;

  const ChangeDate(this.date);
}

class SubmitExpense extends AddExpenseScreenEvent {
  const SubmitExpense();
}