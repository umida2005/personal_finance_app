import 'package:personal_finance_app/src/feature/add_screen/data/add_expense_data.dart';

class MainScreenState {
 final  String name;
  final List<Expense>? expense;
  final MainScreenStatus status;
  final String? error;

  MainScreenState({
    this.name="Ali",
    this.status = MainScreenStatus.none,
    this.expense,
    this.error,
  });

  MainScreenState copyWith({
    String? name,
    List<Expense>? expense,
    MainScreenStatus? status,
    String? error,
  }) {
    return MainScreenState(
      name: name??this.name,
      status: status ?? this.status,
      expense: expense ?? this.expense,
      error: error ?? this.error,
    );
  }
}

enum MainScreenStatus { loading, success, failure, none }
