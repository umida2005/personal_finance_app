import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:personal_finance_app/src/core/component/navigator_key.dart';
import 'package:personal_finance_app/src/feature/intro_screen/presentation/ui.dart';
import 'package:personal_finance_app/src/shared/domain/entities/theme_enum.dart';
import 'package:personal_finance_app/src/shared/domain/model/observable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _theme = 'theme';
const _authenticated = 'authenticated';
const _password = 'password';
const _pin = 'pin';

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

  Future<void> setAuthenticated() async {
    await _preferences.setBool(_authenticated, true);
  }

  Future<void> setPassword(String password) async {
    await _preferences.setString(_password, password);
  }

  Future<String?> getPassword() async {
    return _preferences.getString(_password);
  }

  Future<bool> authenticated() async {
    return _preferences.getBool(_authenticated) ?? false;
  }

  Future<void> logout() async {
    await _preferences.clear();
    await _secureStorage.deleteAll();
    themeObservable.value = ThemeEnum.system;

    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => IntroScreen()),
      (route) => false,
    );
  }

  Future<void> setPin(String pin) async {
    await _preferences.setString(_pin, pin);
  }

  Future<String?> getPin() async {
    return _preferences.getString(_pin);
  }

  Future<void> setAccessToken(String token) async {
    await _secureStorage.write(key: 'accessToken', value: token);
  }

  Future<String> getAccessToken() async {
    final token = await _secureStorage.read(key: 'accessToken');

    if (token == null) {
      await logout();
      return "";
    }

    return token;
  }
}
