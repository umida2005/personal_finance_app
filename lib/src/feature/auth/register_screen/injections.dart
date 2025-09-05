import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/feature/auth/register_screen/domain/register_screen_repository.dart';

void initRegisterScreenInjections() {
  GetIt.I.registerSingleton(RegisterScreenRepository(GetIt.I.get()));

}