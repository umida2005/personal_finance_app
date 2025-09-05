import 'package:personal_finance_app/src/feature/add_screen/data/add_expense_data.dart';

abstract class MainScreenEvent {
  const MainScreenEvent();
}
class LoadExpenseList extends MainScreenEvent{}
class ExpensesUpdated extends MainScreenEvent {
  final List<Expense> expenses;
  final String? error;

  ExpensesUpdated(this.expenses, {this.error});
}
