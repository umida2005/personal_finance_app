import 'package:personal_finance_app/src/feature/add_screen/data/add_expense_data.dart';
import 'package:personal_finance_app/src/feature/add_screen/servise/firebase_database.dart';

class ExpenseRepository {
  final FirebaseDatabaseService _databaseService;

  ExpenseRepository({required FirebaseDatabaseService databaseService})
      : _databaseService = databaseService;

  // TO'G'RI METOD NOMI: addExpense
  Future<void> addExpense(Expense expense) async {
    try {
      print('Repository: Expense qo\'shilmoqda');
      await _databaseService.addExpense(expense.toMap());
      print('Repository: Expense muvaffaqiyatli qo\'shildi');
    } catch (e) {
      print('Repository xatosi: $e');
      throw Exception('Repository: Xarajat qo\'shish mumkin emas: $e');
    }
  }

  Future<void> updateExpense(Expense expense) async {
    try {
      print('Repository: Expense yangilanmoqda');
      await _databaseService.updateExpense(expense.id, expense.toMap());
      print('Repository: Expense muvaffaqiyatli yangilandi');
    } catch (e) {
      print('Repository yangilash xatosi: $e');
      throw Exception('Repository: Xarajat yangilash mumkin emas: $e');
    }
  }

  Future<void> deleteExpense(String id) async {
    await _databaseService.deleteExpense(id);
  }
  Stream<List<Expense>> getExpenses() {
    return _databaseService.getExpensesStream().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return Expense.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id, // Use document ID
        );
      }).toList();
    });
  }
}