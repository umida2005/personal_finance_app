import 'package:cloud_firestore/cloud_firestore.dart';
class LoginScreenRepository {
  LoginScreenRepository();

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("user_data")
          .where("email", isEqualTo: email)
          .where("password", isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs.first.data();
        return userData;
      } else {
        throw Exception("Email yoki parol noto'g'ri");
      }
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }
}