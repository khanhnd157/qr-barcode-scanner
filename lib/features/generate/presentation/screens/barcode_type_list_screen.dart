import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scanner_generator/features/generate/domain/models/barcode_format_type.dart';

class BarcodeTypeListScreen extends StatelessWidget {
  const BarcodeTypeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.3,
      ),
      itemCount: BarcodeFormatType.values.length,
      itemBuilder: (context, index) {
        final format = BarcodeFormatType.values[index];
        return _FormatCard(
          label: format.label,
          icon: format.icon,
          onTap: () =>
              context.push('/generate/barcode/${format.routeName}'),
        );
      },
    );
  }
}

class _FormatCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _FormatCard({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: colorScheme.onSecondaryContainer,
                size: 28,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
