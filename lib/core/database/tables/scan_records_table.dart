import 'package:drift/drift.dart';
import 'package:qr_scanner_generator/shared/enums/code_content.dart';
import 'package:qr_scanner_generator/shared/enums/code_format.dart';
import 'package:qr_scanner_generator/shared/enums/source_type.dart';

class ScanRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get rawValue => text()();
  TextColumn get parsedTitle => text().nullable()();
  TextColumn get parsedSubtitle => text().nullable()();
  IntColumn get contentType => intEnum<CodeContent>()();
  IntColumn get codeFormat => intEnum<CodeFormat>()();
  IntColumn get sourceType => intEnum<SourceType>()();
  BoolColumn get isFavorite =>
      boolean().withDefault(const Constant(false))();
  TextColumn get imagePath => text().nullable()();
  TextColumn get extraData => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
