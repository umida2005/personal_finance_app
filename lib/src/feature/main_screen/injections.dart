import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/feature/add_screen/domain/add_screen_repository.dart';
import 'package:personal_finance_app/src/feature/add_screen/servise/firebase_database.dart';

void initMainScreenInjections() {
  if (!GetIt.I.isRegistered<FirebaseDatabaseService>()) {
    GetIt.I.registerLazySingleton(() => FirebaseDatabaseService());
  }

  if (!GetIt.I.isRegistered<ExpenseRepository>()) {
    GetIt.I.registerLazySingleton(() => ExpenseRepository(
          databaseService: GetIt.I.get<FirebaseDatabaseService>(),
        ));
  }
}
