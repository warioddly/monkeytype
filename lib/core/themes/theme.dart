import 'package:flutter/material.dart';
import 'package:monkeytype/core/themes/colors.dart';


enum AppThemeType {
  light,
  dark,
}

class AppTheme {


  static ThemeData getTheme(AppThemeType type) {
    switch (type) {
      case AppThemeType.light:
        return lightTheme();
      case AppThemeType.dark:
        return darkTheme();
      default:
        return darkTheme();
    }
  }


  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.darkBlue,
        onPrimary: AppColors.black,
        onSecondary: AppColors.black,
        onSurface: AppColors.white,
      ),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      fontFamily: 'Red Alert',
      useMaterial3: true,
      textTheme: const TextTheme(),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          enableFeedback: true,
          foregroundColor: WidgetStateProperty.all(AppColors.white),
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
          shape: WidgetStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        centerTitle: true,
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.darkBlue,
        onPrimary: AppColors.black,
        onSecondary: AppColors.black,
        onSurface: AppColors.white,
      ),
      brightness: Brightness.light,
      fontFamily: 'Red Alert',
      useMaterial3: true,
    );
  }

}