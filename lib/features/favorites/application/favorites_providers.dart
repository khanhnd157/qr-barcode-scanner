import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';

// Favorites list
final favoritesProvider = StreamProvider<List<ScanRecord>>((ref) {
  return ref.watch(scanRecordDaoProvider).watchFavorites();
});
