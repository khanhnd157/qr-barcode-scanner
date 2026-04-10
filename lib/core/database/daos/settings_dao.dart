import 'package:drift/drift.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/core/database/tables/app_settings_table.dart';
import 'package:qr_scanner_generator/shared/enums/theme_mode_option.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [AppSettingsTable])
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(super.db);

  Stream<AppSettingsTableData> watchSettings() {
    return (select(appSettingsTable)
          ..where((t) => t.id.equals(1)))
        .watchSingle();
  }

  Future<AppSettingsTableData> getSettings() {
    return (select(appSettingsTable)
          ..where((t) => t.id.equals(1)))
        .getSingle();
  }

  Future<void> updateThemeMode(ThemeModeOption mode) {
    return (update(appSettingsTable)..where((t) => t.id.equals(1)))
        .write(AppSettingsTableCompanion(themeMode: Value(mode)));
  }

  Future<void> updateLanguage(String language) {
    return (update(appSettingsTable)..where((t) => t.id.equals(1)))
        .write(AppSettingsTableCompanion(language: Value(language)));
  }

  Future<void> updateBeep(bool enabled) {
    return (update(appSettingsTable)..where((t) => t.id.equals(1)))
        .write(AppSettingsTableCompanion(beepEnabled: Value(enabled)));
  }

  Future<void> updateVibrate(bool enabled) {
    return (update(appSettingsTable)..where((t) => t.id.equals(1)))
        .write(
            AppSettingsTableCompanion(vibrateEnabled: Value(enabled)));
  }

  Future<void> updateSaveHistory(bool enabled) {
    return (update(appSettingsTable)..where((t) => t.id.equals(1)))
        .write(
            AppSettingsTableCompanion(saveHistory: Value(enabled)));
  }

  Future<void> updateStoreImages(bool enabled) {
    return (update(appSettingsTable)..where((t) => t.id.equals(1)))
        .write(
            AppSettingsTableCompanion(storeImages: Value(enabled)));
  }

  Future<void> updateAutoCopyClipboard(bool enabled) {
    return (update(appSettingsTable)..where((t) => t.id.equals(1)))
        .write(AppSettingsTableCompanion(
            autoCopyClipboard: Value(enabled)));
  }

  Future<void> updateAutoOpenUrl(bool enabled) {
    return (update(appSettingsTable)..where((t) => t.id.equals(1)))
        .write(
            AppSettingsTableCompanion(autoOpenUrl: Value(enabled)));
  }

  Future<void> updateBulkScanMode(bool enabled) {
    return (update(appSettingsTable)..where((t) => t.id.equals(1)))
        .write(
            AppSettingsTableCompanion(bulkScanMode: Value(enabled)));
  }
}
