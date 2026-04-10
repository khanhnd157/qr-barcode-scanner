import 'package:drift/drift.dart';
import 'package:qr_scanner_generator/shared/enums/theme_mode_option.dart';

class AppSettingsTable extends Table {
  @override
  String get tableName => 'app_settings';

  IntColumn get id => integer().withDefault(const Constant(1))();
  IntColumn get themeMode =>
      intEnum<ThemeModeOption>().withDefault(const Constant(0))();
  TextColumn get language =>
      text().withDefault(const Constant('en'))();
  BoolColumn get beepEnabled =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get vibrateEnabled =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get saveHistory =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get storeImages =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get autoCopyClipboard =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get autoOpenUrl =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get bulkScanMode =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
