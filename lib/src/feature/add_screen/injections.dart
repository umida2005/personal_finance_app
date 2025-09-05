// injections.dart
import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/feature/add_screen/domain/add_screen_repository.dart';
import 'package:personal_finance_app/src/feature/add_screen/servise/firebase_database.dart';

void initAddExpenseScreenInjections() {
  print('AddExpenseScreen injectionlari boshlanmoqda');

  // Faqat bir marta ro'yxatdan o'tkazishni tekshiramiz
  if (!GetIt.I.isRegistered<FirebaseDatabaseService>()) {
    print('FirebaseDatabaseService ro\'yxatdan o\'tkazilmoqda');
    GetIt.I.registerLazySingleton(() => FirebaseDatabaseService());
  } else {
    print('FirebaseDatabaseService allaqachon ro\'yxatdan o\'tgan');
  }

  if (!GetIt.I.isRegistered<ExpenseRepository>()) {
    print('ExpenseRepository ro\'yxatdan o\'tkazilmoqda');
    GetIt.I.registerLazySingleton(() => ExpenseRepository(
      databaseService: GetIt.I.get<FirebaseDatabaseService>(),
    ));
  } else {
    print('ExpenseRepository allaqachon ro\'yxatdan o\'tgan');
  }

  print('AddExpenseScreen injectionlari tugadi');
}