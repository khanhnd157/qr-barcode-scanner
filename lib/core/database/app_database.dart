import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:qr_scanner_generator/core/database/daos/scan_record_dao.dart';
import 'package:qr_scanner_generator/core/database/daos/settings_dao.dart';
import 'package:qr_scanner_generator/core/database/tables/app_settings_table.dart';
import 'package:qr_scanner_generator/core/database/tables/scan_records_table.dart';
import 'package:qr_scanner_generator/shared/enums/code_content.dart';
import 'package:qr_scanner_generator/shared/enums/code_format.dart';
import 'package:qr_scanner_generator/shared/enums/source_type.dart';
import 'package:qr_scanner_generator/shared/enums/theme_mode_option.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [ScanRecords, AppSettingsTable],
  daos: [ScanRecordDao, SettingsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  AppDatabase.defaults()
      : super(
          driftDatabase(name: 'qr_scanner_generator'),
        );

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          // Insert default settings row
          await into(appSettingsTable).insert(
            AppSettingsTableCompanion.insert(),
          );
        },
      );
}
