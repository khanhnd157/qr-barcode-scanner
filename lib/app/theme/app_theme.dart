import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/app/theme/color_schemes.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColorSchemes.light,
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColorSchemes.light.primaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColorSchemes.light.surface,
        foregroundColor: AppColorSchemes.light.onSurface,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColorSchemes.light.outlineVariant,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColorSchemes.dark,
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColorSchemes.dark.primaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColorSchemes.dark.surface,
        foregroundColor: AppColorSchemes.dark.onSurface,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColorSchemes.dark.outlineVariant,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
      ),
    );
  }
}
