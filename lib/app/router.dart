import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scanner_generator/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:qr_scanner_generator/features/generate/domain/models/barcode_format_type.dart';
import 'package:qr_scanner_generator/features/generate/domain/models/qr_content_type.dart';
import 'package:qr_scanner_generator/features/generate/presentation/screens/barcode_create_screen.dart';
import 'package:qr_scanner_generator/features/generate/presentation/screens/generate_screen.dart';
import 'package:qr_scanner_generator/features/generate/presentation/screens/qr_create_screen.dart';
import 'package:qr_scanner_generator/features/history/presentation/screens/history_screen.dart';
import 'package:qr_scanner_generator/features/result/presentation/screens/result_screen.dart';
import 'package:qr_scanner_generator/features/scan/presentation/screens/scan_screen.dart';
import 'package:qr_scanner_generator/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:qr_scanner_generator/features/settings/presentation/screens/settings_screen.dart';
import 'package:qr_scanner_generator/features/settings/presentation/screens/stored_images_screen.dart';
import 'package:qr_scanner_generator/shared/models/scan_record_model.dart';
import 'package:qr_scanner_generator/shared/widgets/app_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/scan',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppScaffold(navigationShell: navigationShell);
        },
        branches: [
          // Scan tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/scan',
                builder: (context, state) => const ScanScreen(),
              ),
            ],
          ),
          // Generate tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/generate',
                builder: (context, state) => const GenerateScreen(),
              ),
            ],
          ),
          // History tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/history',
                builder: (context, state) => const HistoryScreen(),
              ),
            ],
          ),
          // Favorites tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoritesScreen(),
              ),
            ],
          ),
          // Settings tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      // QR create screen
      GoRoute(
        path: '/generate/qr/:type',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final type = QrContentType.fromName(
            state.pathParameters['type']!,
          );
          return QrCreateScreen(contentType: type);
        },
      ),
      // Barcode create screen
      GoRoute(
        path: '/generate/barcode/:format',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final format = BarcodeFormatType.fromName(
            state.pathParameters['format']!,
          );
          return BarcodeCreateScreen(format: format);
        },
      ),
      // Privacy policy screen
      GoRoute(
        path: '/privacy',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      // Stored images screen
      GoRoute(
        path: '/stored-images',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const StoredImagesScreen(),
      ),
      // Result screen (full-screen, outside shell)
      GoRoute(
        path: '/result/preview',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final record = state.extra! as ScanRecordModel;
          return ResultScreen(record: record);
        },
      ),
    ],
  );
});
