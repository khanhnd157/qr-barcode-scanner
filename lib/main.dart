import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_scanner_generator/app/app.dart';
import 'package:qr_scanner_generator/bootstrap.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';

void main() async {
  final database = await Bootstrap.initialize();

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
      ],
      child: const App(),
    ),
  );
}
