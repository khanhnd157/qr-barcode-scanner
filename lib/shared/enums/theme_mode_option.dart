import 'package:flutter/material.dart';

enum ThemeModeOption {
  system('System', Icons.brightness_auto),
  light('Light', Icons.light_mode),
  dark('Dark', Icons.dark_mode);

  const ThemeModeOption(this.label, this.icon);

  final String label;
  final IconData icon;

  ThemeMode toFlutterThemeMode() {
    return switch (this) {
      ThemeModeOption.system => ThemeMode.system,
      ThemeModeOption.light => ThemeMode.light,
      ThemeModeOption.dark => ThemeMode.dark,
    };
  }
}
