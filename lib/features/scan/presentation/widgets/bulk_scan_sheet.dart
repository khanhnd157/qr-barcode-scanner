import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scanner_generator/features/scan/application/scan_providers.dart';
import 'package:qr_scanner_generator/shared/models/scan_record_model.dart';
import 'package:qr_scanner_generator/shared/widgets/code_type_icon.dart';

class BulkScanSheet extends ConsumerWidget {
  const BulkScanSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(bulkScanResultsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    if (results.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface.withAlpha(230),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.burst_mode, color: colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Bulk Scan — point at codes',
              style: TextStyle(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.35,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface.withAlpha(240),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 4),
            child: Row(
              children: [
                Icon(Icons.burst_mode, color: colorScheme.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  '${results.length} scanned',
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    ref.read(bulkScanResultsProvider.notifier).clear();
                  },
                  child: const Text('Clear'),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(bulkScanResultsProvider.notifier).clear();
                    // Navigate to history
                    context.go('/history');
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // List
          Flexible(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 4),
              shrinkWrap: true,
              itemCount: results.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                // Show newest first
                final record = results[results.length - 1 - index];
                return _BulkScanTile(
                  record: record,
                  onTap: () =>
                      context.push('/result/preview', extra: record),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BulkScanTile extends StatelessWidget {
  final ScanRecordModel record;
  final VoidCallback onTap;

  const _BulkScanTile({required this.record, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: CodeTypeIcon(contentType: record.contentType, size: 32),
      title: Text(
        record.parsedTitle ?? record.rawValue,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13),
      ),
      subtitle: Text(
        record.contentType.label,
        style: const TextStyle(fontSize: 11),
      ),
      trailing: const Icon(Icons.chevron_right, size: 18),
      onTap: onTap,
    );
  }
}
