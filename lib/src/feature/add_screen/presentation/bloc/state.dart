

class AddExpenseScreenState {
  final String category;
  final String amount;
  final String note;
  final DateTime date;
  final String errorMessage;
  final AddExpenseStatus status;
  final String? expenseId;

  AddExpenseScreenState({
    this.category = 'Ovqat',
    this.amount = '',
    this.note = '',
    required this.date,
    this.errorMessage = "",
    this.status = AddExpenseStatus.none,
    this.expenseId,
  });

  AddExpenseScreenState copyWith({
    String? category,
    String? amount,
    String? note,
    DateTime? date,
    String? errorMessage,
    AddExpenseStatus? status,
    String? expenseId,
  }) {
    return AddExpenseScreenState(
      category: category ?? this.category,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      date: date ?? this.date,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      expenseId: expenseId ?? this.expenseId,
    );
  }
}

enum AddExpenseStatus { loading, success, failure, none }