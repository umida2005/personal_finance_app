import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_finance_app/src/shared/data/app_shared_prefs.dart';

class RegisterScreenRepository {
 final AppSharedPrefs _prefs;

  RegisterScreenRepository(this._prefs);

  Future<void> registerUser(String name, String email, String password) async {
    try {
      final userDoc = FirebaseFirestore.instance.collection("user_data").doc();
      await userDoc.set({
        "user_name": name,
        "email": email,
        "password": password,
        "user_id": userDoc.id,
      });
      _prefs.setName(name);
      _prefs.setPassword(password);
    } catch (e) {
      throw Exception("Registration failed: $e");
    }
  }
}
