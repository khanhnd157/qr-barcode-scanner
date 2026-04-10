import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/shared/widgets/code_type_icon.dart';

class HistoryTile extends StatelessWidget {
  final ScanRecord record;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onToggleFavorite;

  const HistoryTile({
    super.key,
    required this.record,
    required this.onTap,
    required this.onDelete,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dismissible(
      key: ValueKey(record.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => _confirmDelete(context),
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: colorScheme.errorContainer,
        child: Icon(Icons.delete, color: colorScheme.onErrorContainer),
      ),
      child: ListTile(
        leading: CodeTypeIcon(contentType: record.contentType),
        title: Text(
          record.parsedTitle ?? record.rawValue,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${record.parsedSubtitle ?? record.contentType.label}  •  ${_timeAgo(record.createdAt)}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            record.isFavorite ? Icons.star : Icons.star_border,
            color: record.isFavorite ? Colors.amber : null,
            size: 22,
          ),
          onPressed: onToggleFavorite,
        ),
        onTap: onTap,
      ),
    );
  }

  Future<bool?> _confirmDelete(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  String _timeAgo(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
