import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_scanner_generator/features/history/application/history_providers.dart';
import 'package:qr_scanner_generator/features/history/presentation/widgets/history_list_view.dart';
import 'package:qr_scanner_generator/features/history/presentation/widgets/history_search_bar.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';
import 'package:qr_scanner_generator/shared/enums/source_type.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) => _handleMenuAction(context, ref, value),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'clear_scanned',
                  child: Text('Clear Scanned'),
                ),
                const PopupMenuItem(
                  value: 'clear_created',
                  child: Text('Clear Created'),
                ),
                const PopupMenuItem(
                  value: 'clear_all',
                  child: Text('Clear All'),
                ),
              ],
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Scanned'),
              Tab(text: 'Created'),
            ],
          ),
        ),
        body: Column(
          children: [
            const HistorySearchBar(),
            Expanded(
              child: TabBarView(
                children: [
                  // Scanned tab
                  HistoryListView(
                    recordsAsync: ref.watch(scannedHistoryProvider),
                    emptyTitle: 'No scanned results',
                    emptySubtitle: 'Scan a QR code or barcode to see it here',
                    emptyIcon: Icons.qr_code_scanner,
                  ),
                  // Created tab
                  HistoryListView(
                    recordsAsync: ref.watch(createdHistoryProvider),
                    emptyTitle: 'No created results',
                    emptySubtitle: 'Generate a QR code or barcode to see it here',
                    emptyIcon: Icons.add_box,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleMenuAction(
    BuildContext context,
    WidgetRef ref,
    String action,
  ) {
    final dao = ref.read(scanRecordDaoProvider);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear History'),
        content: Text(
          action == 'clear_all'
              ? 'Delete all history items?'
              : action == 'clear_scanned'
                  ? 'Delete all scanned results?'
                  : 'Delete all created results?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              switch (action) {
                case 'clear_scanned':
                  dao.deleteAllBySourceType(SourceType.scanned);
                case 'clear_created':
                  dao.deleteAllBySourceType(SourceType.created);
                case 'clear_all':
                  dao.deleteAll();
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
