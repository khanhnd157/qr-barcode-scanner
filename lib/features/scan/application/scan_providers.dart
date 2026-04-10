import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_scanner_generator/core/utils/haptic_util.dart';
import 'package:qr_scanner_generator/features/scan/domain/scan_service.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';
import 'package:qr_scanner_generator/shared/models/scan_record_model.dart';

// Haptic utility singleton
final hapticUtilProvider = Provider<HapticUtil>((ref) {
  final haptic = HapticUtil();
  ref.onDispose(() => haptic.dispose());
  return haptic;
});

// Scan service
final scanServiceProvider = Provider<ScanService>((ref) {
  return ScanService(
    dao: ref.watch(scanRecordDaoProvider),
    settings: ref.watch(settingsProvider),
    haptic: ref.watch(hapticUtilProvider),
  );
});

// Flash state
final flashStateProvider = StateProvider<bool>((ref) => false);

// Current tab index (for pausing camera when not on scan tab)
final currentTabIndexProvider = StateProvider<int>((ref) => 0);

// Bulk scan mode — reads from settings
final bulkScanModeProvider = Provider<bool>((ref) {
  return ref.watch(settingsProvider).bulkScanMode;
});

// Bulk scan accumulated results
final bulkScanResultsProvider =
    StateNotifierProvider<BulkScanNotifier, List<ScanRecordModel>>(
  (ref) => BulkScanNotifier(),
);

class BulkScanNotifier extends StateNotifier<List<ScanRecordModel>> {
  BulkScanNotifier() : super([]);

  final Set<String> _seenValues = {};

  /// Adds a record if not a duplicate within this session.
  /// Returns true if added, false if duplicate.
  bool add(ScanRecordModel record) {
    if (_seenValues.contains(record.rawValue)) return false;
    _seenValues.add(record.rawValue);
    state = [...state, record];
    return true;
  }

  void clear() {
    _seenValues.clear();
    state = [];
  }

  int get count => state.length;
}
