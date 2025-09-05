import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreenRepository {
  RegisterScreenRepository();

  Future<void> registerUser(String name, String email, String password) async {
    try {
      final userDoc = FirebaseFirestore.instance.collection("user_data").doc();
      await userDoc.set({
        "user_name": name,
        "email": email,
        "password": password,
        "user_id": userDoc.id,
      });
    } catch (e) {
      throw Exception("Registration failed: $e");
    }
  }
}
