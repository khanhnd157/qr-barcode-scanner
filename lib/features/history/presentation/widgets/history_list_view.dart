import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/features/history/presentation/widgets/history_tile.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';
import 'package:qr_scanner_generator/shared/models/scan_record_model.dart';
import 'package:qr_scanner_generator/shared/widgets/empty_state_widget.dart';

class HistoryListView extends ConsumerWidget {
  final AsyncValue<List<ScanRecord>> recordsAsync;
  final String emptyTitle;
  final String emptySubtitle;
  final IconData emptyIcon;

  const HistoryListView({
    super.key,
    required this.recordsAsync,
    this.emptyTitle = 'No history yet',
    this.emptySubtitle = 'Scanned or created items will appear here',
    this.emptyIcon = Icons.history,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return recordsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
      data: (records) {
        if (records.isEmpty) {
          return EmptyStateWidget(
            icon: emptyIcon,
            title: emptyTitle,
            subtitle: emptySubtitle,
          );
        }

        return ListView.separated(
          itemCount: records.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final record = records[index];
            return HistoryTile(
              record: record,
              onTap: () => _navigateToResult(context, record),
              onDelete: () =>
                  ref.read(scanRecordDaoProvider).deleteRecord(record.id),
              onToggleFavorite: () => ref
                  .read(scanRecordDaoProvider)
                  .toggleFavorite(record.id, !record.isFavorite),
            );
          },
        );
      },
    );
  }

  void _navigateToResult(BuildContext context, ScanRecord record) {
    final model = ScanRecordModel(
      id: record.id,
      rawValue: record.rawValue,
      parsedTitle: record.parsedTitle,
      parsedSubtitle: record.parsedSubtitle,
      contentType: record.contentType,
      codeFormat: record.codeFormat,
      sourceType: record.sourceType,
      isFavorite: record.isFavorite,
      imagePath: record.imagePath,
      extraData: record.extraData,
      createdAt: record.createdAt,
    );
    context.push('/result/preview', extra: model);
  }
}
