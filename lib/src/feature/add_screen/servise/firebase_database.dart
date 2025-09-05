import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseService {
  final CollectionReference _expensesCollection =
  FirebaseFirestore.instance.collection('expenses');

  Future<void> addExpense(Map<String, dynamic> expense) async {
    try {
      print('Firestorega saqlanmoqda: $expense');
      await _expensesCollection.add(expense); // .add() yangi document yaratadi
      print('Firestorega muvaffaqiyatli saqlandi');
    } catch (e) {
      print('Firestore xatosi: $e');
      throw Exception('Firestorega saqlash mumkin emas: $e');
    }
  }

  Future<void> updateExpense(String id, Map<String, dynamic> expense) async {
    try {
      print('Firestoreda yangilanmoqda: $id - $expense');
      await _expensesCollection.doc(id).update(expense); // .doc(id) bilan
      print('Firestoreda muvaffaqiyatli yangilandi');
    } catch (e) {
      print('Firestore yangilash xatosi: $e');
      throw Exception('Firestoreda yangilash mumkin emas: $e');
    }
  }

  Future<void> deleteExpense(String id) async {
    try {
      await _expensesCollection.doc(id).delete();
      print('Firestoredan muvaffaqiyatli o\'chirildi');
    } catch (e) {
      print('Firestore o\'chirish xatosi: $e');
      throw Exception('Firestoredan o\'chirish mumkin emas: $e');
    }
  }

  Stream<QuerySnapshot> getExpensesStream() {
    return _expensesCollection.snapshots(); // Firestore uchun snapshots()
  }
}