import 'package:drift/drift.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/core/database/tables/scan_records_table.dart';
import 'package:qr_scanner_generator/shared/enums/source_type.dart';

part 'scan_record_dao.g.dart';

@DriftAccessor(tables: [ScanRecords])
class ScanRecordDao extends DatabaseAccessor<AppDatabase>
    with _$ScanRecordDaoMixin {
  ScanRecordDao(super.db);

  Future<int> insertRecord(ScanRecordsCompanion entry) {
    return into(scanRecords).insert(entry);
  }

  Stream<List<ScanRecord>> watchBySourceType(SourceType type) {
    return (select(scanRecords)
          ..where((t) => t.sourceType.equalsValue(type))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  Stream<List<ScanRecord>> watchFavorites() {
    return (select(scanRecords)
          ..where((t) => t.isFavorite.equals(true))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  Stream<List<ScanRecord>> watchSearch(
    String query, {
    SourceType? sourceType,
  }) {
    final pattern = '%$query%';
    return (select(scanRecords)
          ..where((t) {
            final matchesQuery = t.rawValue.like(pattern) |
                t.parsedTitle.like(pattern) |
                t.parsedSubtitle.like(pattern);
            if (sourceType != null) {
              return matchesQuery & t.sourceType.equalsValue(sourceType);
            }
            return matchesQuery;
          })
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  Future<void> toggleFavorite(int id, bool isFavorite) {
    return (update(scanRecords)..where((t) => t.id.equals(id)))
        .write(ScanRecordsCompanion(isFavorite: Value(isFavorite)));
  }

  Future<int> deleteRecord(int id) {
    return (delete(scanRecords)..where((t) => t.id.equals(id))).go();
  }

  Future<int> deleteAllBySourceType(SourceType type) {
    return (delete(scanRecords)
          ..where((t) => t.sourceType.equalsValue(type)))
        .go();
  }

  Future<int> deleteAll() {
    return delete(scanRecords).go();
  }

  Future<ScanRecord?> getById(int id) {
    return (select(scanRecords)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<bool> isDuplicate(
    String rawValue, {
    Duration window = const Duration(seconds: 3),
  }) async {
    final cutoff = DateTime.now().subtract(window);
    final results = await (select(scanRecords)
          ..where(
            (t) =>
                t.rawValue.equals(rawValue) &
                t.createdAt.isBiggerThanValue(cutoff),
          ))
        .get();
    return results.isNotEmpty;
  }
}
