import 'package:flutter/material.dart';

class AppColorSchemes {
  static const _seedColor = Color(0xFF0288D1); // Blue

  static final light = ColorScheme.fromSeed(
    seedColor: _seedColor,
    brightness: Brightness.light,
  );

  static final dark = ColorScheme.fromSeed(
    seedColor: _seedColor,
    brightness: Brightness.dark,
  );
}
