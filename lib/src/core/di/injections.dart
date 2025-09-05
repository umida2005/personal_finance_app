
import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/feature/app/injections.dart';
import 'package:personal_finance_app/src/feature/auth/login_screen/injections.dart';
import 'package:personal_finance_app/src/feature/auth/register_screen/injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initInjections() async {
  await initSharedPrefsInjections();

  initAppInjections();
  initRegisterScreenInjections();
  initLoginScreenInjections();


}

Future<void> initSharedPrefsInjections() async {
  GetIt.I.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await GetIt.I.isReady<SharedPreferences>();
}
