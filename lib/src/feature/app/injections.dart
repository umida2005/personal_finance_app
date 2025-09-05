import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/shared/data/app_shared_prefs.dart';

void initAppInjections() {
  GetIt.I.registerSingleton(const FlutterSecureStorage());
  GetIt.I.registerSingleton(AppSharedPrefs(GetIt.I.get(), GetIt.I.get()));
}
