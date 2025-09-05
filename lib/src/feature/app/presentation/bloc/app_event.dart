

import 'package:personal_finance_app/src/shared/domain/entities/theme_enum.dart';

abstract class AppEvent {}

class ThemeChangedEvent extends AppEvent {
  final ThemeEnum newTheme;

  ThemeChangedEvent(this.newTheme);
}
