import 'package:flutter/material.dart';

abstract class ExtraColors {
  static const primary = Color(0xFF05143C);
  static const inputBackground = Color(0xFFFFFFFF);
  static const inputTextColor = Color(0xFFFFFFFF);
  static const inputBorder = Color(0x1F000000);
  static const hiltColor = Color(0xFF9E9E9E);
  static const bottomSheetBackground = Color(0xFFB5B2B2);
  static const selectedBorder = Color(0xFF42C2D5);
  static const modalBarrier = Color(0x71979797);

  // AC Controller Colors
  static const acPrimaryDark = Color(0xFF1A1B2E);
  static const acSecondaryDark = Color(0xFF16213E);
  static const acAccentBlue = Color(0xFF0F3460);
  static const acAccentTeal = Color(0xFF16537E);
  static const acActiveOrange = Color(0xFFE94560);
  static const acWarmRed = Color(0xFFF59E0B);
  static const acCoolBlue = Color(0xFF0D6EFD);
  static const acNeutralGray = Color(0xFF6C757D);
  static const acLightGray = Color(0xFF979D9E);
  static const acSurfaceColor = Color(0xFF212529);

  //My car screen
  static const firstGradientBlue = Color(0xFF00D4FF);
  static const secondGradientBlue = Color(0xFF5A67D8);
  static const batteryColor = Color(0xFF4CAF50);
  static const engineColor = Color(0xFFB9F6CA);
  static const white = Color(0xFFFFFFFF);
}

class AppTheme extends ThemeExtension<AppTheme> {
  final Color backgroundColor;
  final Color backgroundSecondaryColor;
  final Color backgroundBottomSheet;
  final Color textMainColor;
  final Color buttonMainColor;
  final Color textSecondaryColor;
  final Color primaryColor;
  final Color primaryTextColor;
  final Color dropDownColor;
  final Color powerColor;

  // AC Controller Colors
  final Color acPrimaryBackground;
  final Color acSecondaryBackground;
  final Color acSurfaceColor;
  final Color acAccentColor;
  final Color acAccentBlue;
  final Color acWarmColor;
  final Color acCoolColor;
  final Color acActiveColor;
  final Color acTextPrimary;
  final Color acTextSecondary;
  final Color acNeutralColor;

  AppTheme({
    required this.backgroundColor,
    required this.backgroundSecondaryColor,
    required this.backgroundBottomSheet,
    required this.textMainColor,
    required this.buttonMainColor,
    required this.textSecondaryColor,
    required this.primaryColor,
    required this.primaryTextColor,
    required this.dropDownColor,
    required this.powerColor,
    // AC Controller Colors
    required this.acPrimaryBackground,
    required this.acSecondaryBackground,
    required this.acSurfaceColor,
    required this.acAccentColor,
    required this.acAccentBlue,
    required this.acWarmColor,
    required this.acCoolColor,
    required this.acActiveColor,
    required this.acTextPrimary,
    required this.acTextSecondary,
    required this.acNeutralColor,
  });

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? backgroundColor,
    Color? backgroundSecondaryColor,
    Color? backgroundBottomSheet,
    Color? textMainColor,
    Color? buttonMainColor,
    Color? textSecondaryColor,
    Color? primaryColor,
    Color? primaryTextColor,
    Color? dropDownColor,
    Color? powerColor,
    // AC Controller Colors
    Color? acPrimaryBackground,
    Color? acSecondaryBackground,
    Color? acSurfaceColor,
    Color? acAccentColor,
    Color? acAccentBlue,
    Color? acWarmColor,
    Color? acCoolColor,
    Color? acActiveColor,
    Color? acTextPrimary,
    Color? acTextSecondary,
    Color? acNeutralColor,
  }) {
    return AppTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundSecondaryColor:
          backgroundSecondaryColor ?? this.backgroundSecondaryColor,
      backgroundBottomSheet:
          backgroundBottomSheet ?? this.backgroundBottomSheet,
      textMainColor: textMainColor ?? this.textMainColor,
      buttonMainColor: buttonMainColor ?? this.buttonMainColor,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      dropDownColor: dropDownColor ?? this.dropDownColor,
      powerColor: powerColor ?? this.powerColor,
      // AC Controller Colors
      acPrimaryBackground: acPrimaryBackground ?? this.acPrimaryBackground,
      acSecondaryBackground:
          acSecondaryBackground ?? this.acSecondaryBackground,
      acSurfaceColor: acSurfaceColor ?? this.acSurfaceColor,
      acAccentColor: acAccentColor ?? this.acAccentColor,
      acAccentBlue: acAccentBlue ?? this.acAccentBlue,
      acWarmColor: acWarmColor ?? this.acWarmColor,
      acCoolColor: acCoolColor ?? this.acCoolColor,
      acActiveColor: acActiveColor ?? this.acActiveColor,
      acTextPrimary: acTextPrimary ?? this.acTextPrimary,
      acTextSecondary: acTextSecondary ?? this.acTextSecondary,
      acNeutralColor: acNeutralColor ?? this.acNeutralColor,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) return this;
    return AppTheme(
      backgroundColor:
          Color.lerp(backgroundColor, other.backgroundColor, t) ??
          other.backgroundColor,
      backgroundSecondaryColor:
          Color.lerp(
            backgroundSecondaryColor,
            other.backgroundSecondaryColor,
            t,
          ) ??
          other.backgroundSecondaryColor,
      backgroundBottomSheet:
          Color.lerp(backgroundBottomSheet, other.backgroundBottomSheet, t) ??
          other.backgroundBottomSheet,
      textMainColor:
          Color.lerp(textMainColor, other.textMainColor, t) ??
          other.textMainColor,
      buttonMainColor:
          Color.lerp(buttonMainColor, other.buttonMainColor, t) ??
          other.buttonMainColor,
      textSecondaryColor:
          Color.lerp(textSecondaryColor, other.textSecondaryColor, t) ??
          other.textSecondaryColor,
      primaryColor:
          Color.lerp(primaryColor, other.primaryColor, t) ?? other.primaryColor,
      primaryTextColor:
          Color.lerp(primaryTextColor, other.primaryTextColor, t) ??
          other.primaryTextColor,
      dropDownColor:
          Color.lerp(dropDownColor, other.dropDownColor, t) ??
          other.dropDownColor,
      powerColor:
          Color.lerp(powerColor, other.powerColor, t) ??
          other.powerColor,
      // AC Controller Colors
      acPrimaryBackground:
          Color.lerp(acPrimaryBackground, other.acPrimaryBackground, t) ??
          other.acPrimaryBackground,
      acSecondaryBackground:
          Color.lerp(acSecondaryBackground, other.acSecondaryBackground, t) ??
          other.acSecondaryBackground,
      acSurfaceColor:
          Color.lerp(acSurfaceColor, other.acSurfaceColor, t) ??
          other.acSurfaceColor,
      acAccentColor:
          Color.lerp(acAccentColor, other.acAccentColor, t) ??
          other.acAccentColor,
      acAccentBlue:
          Color.lerp(acAccentBlue, other.acAccentBlue, t) ?? other.acAccentBlue,
      acWarmColor:
          Color.lerp(acWarmColor, other.acWarmColor, t) ?? other.acWarmColor,
      acCoolColor:
          Color.lerp(acCoolColor, other.acCoolColor, t) ?? other.acCoolColor,
      acActiveColor:
          Color.lerp(acActiveColor, other.acActiveColor, t) ??
          other.acActiveColor,
      acTextPrimary:
          Color.lerp(acTextPrimary, other.acTextPrimary, t) ??
          other.acTextPrimary,
      acTextSecondary:
          Color.lerp(acTextSecondary, other.acTextSecondary, t) ??
          other.acTextSecondary,
      acNeutralColor:
          Color.lerp(acNeutralColor, other.acNeutralColor, t) ??
          other.acNeutralColor,
    );
  }
}

final lightAppTheme = AppTheme(
  backgroundColor: const Color(0xFFFFFFFF),
  backgroundBottomSheet: const Color(0xFFE2E7F4),
  backgroundSecondaryColor: const Color(0xFF05143C),
  textMainColor: Color(0xFF000000),
  buttonMainColor: Color(0xFF05143C),
  textSecondaryColor: Color(0xFF000000),
  primaryColor: Color(0xFFE2E7F4),
  primaryTextColor: Color(0xFFFFFFFF),
  dropDownColor: Color(0xFFE3F2FD),
  powerColor: Color(0xFF35A61F),
  // AC Controller Light Colors
  acPrimaryBackground: const Color(0xFFFAFBFC),
  acSecondaryBackground: const Color(0xFFF5F6FA),
  acSurfaceColor: const Color(0xFFE8E9ED),
  acAccentColor: const Color(0xFF20B2AA),
  acAccentBlue: const Color(0xFF4A90E2),
  acWarmColor: ExtraColors.acWarmRed,
  acCoolColor: ExtraColors.acCoolBlue,
  acActiveColor: ExtraColors.acActiveOrange,
  acTextPrimary: const Color(0xFF2C3E50),
  acTextSecondary: const Color(0xFF7F8C8D),
  acNeutralColor: const Color(0xFF7F8C8D),
);

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: lightAppTheme.backgroundColor,
  colorScheme: ColorScheme.light(
    primary: lightAppTheme.primaryColor,
    onPrimary: lightAppTheme.textMainColor,
  ),
  extensions: [lightAppTheme],
);

final darkAppTheme = AppTheme(
  backgroundColor: const Color(0xFF05143C),
  backgroundSecondaryColor: const Color(0xFFFFFFFF),
  backgroundBottomSheet: const Color(0xFF05143C),
  textMainColor: Color(0xFFFFFFFF),
  buttonMainColor: Color(0xFFFFFFFF),
  textSecondaryColor: Color(0xFFFFFFFF),
  primaryColor: Color(0xFFAFC8FF),
  primaryTextColor: Color(0xFF000000),
  dropDownColor: Color(0xFF0C2143),
  powerColor: Colors.greenAccent,
  // AC Controller Dark Colors
  acPrimaryBackground: ExtraColors.acPrimaryDark,
  acSecondaryBackground: ExtraColors.acSecondaryDark,
  acSurfaceColor: ExtraColors.acSurfaceColor,
  acAccentColor: ExtraColors.acAccentTeal,
  acAccentBlue: ExtraColors.acAccentBlue,
  acWarmColor: ExtraColors.acWarmRed,
  acCoolColor: ExtraColors.acCoolBlue,
  acActiveColor: ExtraColors.acActiveOrange,
  acTextPrimary: Colors.white,
  acTextSecondary: ExtraColors.acLightGray,
  acNeutralColor: ExtraColors.acNeutralGray,
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: darkAppTheme.backgroundColor,
  colorScheme: ColorScheme.dark(
    primary: darkAppTheme.primaryColor,
    onPrimary: darkAppTheme.textMainColor,
  ),
  extensions: [darkAppTheme],
);

extension AppThemeExtension on BuildContext {
  AppTheme getAppTheme() {
    return Theme.of(this).extension<AppTheme>()!;
  }
}
//
// extension FontExtension on BuildContext {
//   TextStyle textStyle32W600() {
//     return GoogleFonts.rubik(
//       fontSize: 32,
//       fontWeight: FontWeight.w600,
//       textStyle: Theme.of(this).textTheme.displayLarge,
//     );
//   }
// }
