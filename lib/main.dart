import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/core/di/injections.dart';
import 'package:personal_finance_app/src/feature/app/presentation/app_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await initInjections();

  runApp( const App());
}
