import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';
import 'package:qr_scanner_generator/shared/enums/source_type.dart';

// Search query
final historySearchQueryProvider = StateProvider<String>((ref) => '');

// Scanned history
final scannedHistoryProvider = StreamProvider<List<ScanRecord>>((ref) {
  final query = ref.watch(historySearchQueryProvider);
  final dao = ref.watch(scanRecordDaoProvider);
  if (query.isEmpty) {
    return dao.watchBySourceType(SourceType.scanned);
  }
  return dao.watchSearch(query, sourceType: SourceType.scanned);
});

// Created history
final createdHistoryProvider = StreamProvider<List<ScanRecord>>((ref) {
  final query = ref.watch(historySearchQueryProvider);
  final dao = ref.watch(scanRecordDaoProvider);
  if (query.isEmpty) {
    return dao.watchBySourceType(SourceType.created);
  }
  return dao.watchSearch(query, sourceType: SourceType.created);
});
