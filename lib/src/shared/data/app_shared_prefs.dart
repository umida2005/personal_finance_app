import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:personal_finance_app/src/shared/domain/entities/theme_enum.dart';
import 'package:personal_finance_app/src/shared/domain/model/observable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _theme = 'theme';
const _name = 'name';
const _password = 'password';

class AppSharedPrefs {
  final SharedPreferences _preferences;
  final FlutterSecureStorage _secureStorage;
  final themeObservable = Observable<ThemeEnum>(ThemeEnum.system);

  AppSharedPrefs(this._preferences, this._secureStorage) {
    themeObservable.value = getTheme();
  }

  ThemeEnum getTheme() {
    String? data = _preferences.getString(_theme) ?? ThemeEnum.system.name;

    return ThemeEnum.values.firstWhere(
          (element) => element.name == data,
      orElse: () => ThemeEnum.system,
    );
  }

  Future<void> setTheme(ThemeEnum theme) async {
    await _preferences.setString(_theme, theme.name);
    themeObservable.value = theme;
  }


  Future<void> setPassword(String password) async {
    await _preferences.setString(_password, password);
  }

  Future<String?> getPassword() async {
    return _preferences.getString(_password);
  }

  Future<void> setName(String name) async {
    await _preferences.setString(_name, name);
  }

  Future<String?> getName() async {
    return _preferences.getString(_name);
  }


  Future<void> logout() async {
    await _preferences.clear();
    await _secureStorage.deleteAll();
    themeObservable.value = ThemeEnum.system;
  }
}