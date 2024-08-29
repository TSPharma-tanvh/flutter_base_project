part of '../core.dart';

class AppThemeCore {
  factory AppThemeCore.of(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return const AppThemeCore(AppThemeMode.light);
      case ThemeMode.dark:
        return const AppThemeCore(AppThemeMode.dark);
      default:
        return const AppThemeCore(AppThemeMode.light);
    }
  }

  // Light theme
  static ThemeData light() {
    final baseTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: AppColors.light().mainGreen,
      scaffoldBackgroundColor: AppColors.light().mainBackground,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.beVietnamProTextTheme(baseTheme.textTheme),
    );
  }

  // Dark theme
  static ThemeData dark() {
    final baseTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorSchemeSeed: AppColors.light().mainGreen,
      scaffoldBackgroundColor: AppColors.light().mainBackground,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.beVietnamProTextTheme(baseTheme.textTheme),
    );
  }

  final AppThemeMode themeMode;

  const AppThemeCore(this.themeMode);

  AppColors get colors {
    switch (themeMode) {
      case AppThemeMode.light:
        return AppColors.light();
      case AppThemeMode.dark:
        return AppColors.light();
    }
  }
}

enum AppThemeMode { light, dark }
