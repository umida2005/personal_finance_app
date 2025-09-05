
enum ThemeEnum {
  light,
  dark,
  system,
}

extension ThemeExtension on ThemeEnum {
  String get translatableName {
    switch (this) {
      case ThemeEnum.light:
        return "LocaleKeys.ligthMode";
      case ThemeEnum.dark:
        return "LocaleKeys.darkMode";
      case ThemeEnum.system:
        return "LocaleKeys.systemMode";
    }
  }

  String get iconPath {
    switch (this) {
      case ThemeEnum.light:
        return "Assets.iconsLight";
      case ThemeEnum.dark:
        return "Assets.iconsDark";
      case ThemeEnum.system:
        return "Assets.iconsSystem";
    }
  }
}
