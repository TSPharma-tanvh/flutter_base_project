import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AppState extends CoreState {
  final Locale? locale;
  final int? countUnread;
  final bool showOnboarding;
  final String secondAppValue;

  const AppState({
    required super.themeMode,
    required super.theme,
    this.locale,
    this.countUnread,
    this.showOnboarding = false,
    this.secondAppValue = "",
  });

  @override
  List<Object?> get props => [
        themeMode,
        theme,
        locale,
        countUnread,
        showOnboarding,
        secondAppValue,
      ];

  AppState copyWith({
    AppThemeMode? themeMode,
    AppThemeCore? theme,
    Locale? locale,
    int? countUnread,
    bool? showOnboarding,
    String? secondAppValue,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      countUnread: countUnread ?? this.countUnread,
      showOnboarding: showOnboarding ?? this.showOnboarding,
      secondAppValue: secondAppValue ?? this.secondAppValue,
    );
  }
}

final class AppInitial extends AppState {
  const AppInitial()
      : super(
          themeMode: AppThemeMode.light,
          theme: const AppThemeCore(AppThemeMode.light),
          countUnread: 0,
        );
}
