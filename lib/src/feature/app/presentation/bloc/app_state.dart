

import 'package:personal_finance_app/src/shared/domain/entities/theme_enum.dart';

class AppState {
  final ThemeEnum theme;

  AppState({required this.theme});

  AppState copyWith({
    ThemeEnum? theme,
  }) {
    return AppState(
      theme: theme ?? this.theme,
    );
  }
}

