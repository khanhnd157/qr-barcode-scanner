import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/features/favorites/application/favorites_providers.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';
import 'package:qr_scanner_generator/shared/models/scan_record_model.dart';
import 'package:qr_scanner_generator/shared/widgets/code_type_icon.dart';
import 'package:qr_scanner_generator/shared/widgets/empty_state_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favoritesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (favorites) {
          if (favorites.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.star_border,
              title: 'No favorites yet',
              subtitle: 'Star items from scan results or history to save them here',
            );
          }

          return ListView.separated(
            itemCount: favorites.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final record = favorites[index];
              return _FavoriteTile(
                record: record,
                onTap: () => _navigateToResult(context, record),
                onUnfavorite: () => ref
                    .read(scanRecordDaoProvider)
                    .toggleFavorite(record.id, false),
              );
            },
          );
        },
      ),
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

class _FavoriteTile extends StatelessWidget {
  final ScanRecord record;
  final VoidCallback onTap;
  final VoidCallback onUnfavorite;

  const _FavoriteTile({
    required this.record,
    required this.onTap,
    required this.onUnfavorite,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: CodeTypeIcon(contentType: record.contentType),
      title: Text(
        record.parsedTitle ?? record.rawValue,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '${record.parsedSubtitle ?? record.contentType.label}  •  ${record.sourceType.label}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.star, color: Colors.amber, size: 22),
        onPressed: onUnfavorite,
      ),
      onTap: onTap,
    );
  }
}
