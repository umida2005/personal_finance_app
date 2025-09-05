import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/feature/auth/login_screen/domain/login_repository.dart';

void initLoginScreenInjections() {
  GetIt.I.registerSingleton(LoginScreenRepository());
}