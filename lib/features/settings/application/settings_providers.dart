import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/core/database/daos/settings_dao.dart';
import 'package:qr_scanner_generator/features/settings/domain/settings_model.dart';

// Database provider - overridden in main.dart
final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('Database must be initialized in bootstrap');
});

// DAOs
final settingsDaoProvider = Provider<SettingsDao>((ref) {
  return ref.watch(databaseProvider).settingsDao;
});

final scanRecordDaoProvider = Provider((ref) {
  return ref.watch(databaseProvider).scanRecordDao;
});

// Settings stream from DB
final settingsStreamProvider = StreamProvider<AppSettingsTableData>((ref) {
  return ref.watch(settingsDaoProvider).watchSettings();
});

// Convenience settings accessor
final settingsProvider = Provider<AppSettings>((ref) {
  final asyncSettings = ref.watch(settingsStreamProvider);
  return asyncSettings.when(
    data: (s) => AppSettings(
      themeMode: s.themeMode,
      language: s.language,
      beepEnabled: s.beepEnabled,
      vibrateEnabled: s.vibrateEnabled,
      saveHistory: s.saveHistory,
      storeImages: s.storeImages,
      autoCopyClipboard: s.autoCopyClipboard,
      autoOpenUrl: s.autoOpenUrl,
      bulkScanMode: s.bulkScanMode,
    ),
    loading: () => AppSettings.defaults(),
    error: (_, __) => AppSettings.defaults(),
  );
});

// Theme mode for MaterialApp
final themeModeProvider = Provider<ThemeMode>((ref) {
  final settings = ref.watch(settingsProvider);
  return settings.themeMode.toFlutterThemeMode();
});
