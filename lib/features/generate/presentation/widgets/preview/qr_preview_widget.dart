import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPreviewWidget extends StatelessWidget {
  final String data;
  final GlobalKey repaintKey;
  final double size;

  const QrPreviewWidget({
    super.key,
    required this.data,
    required this.repaintKey,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (data.isEmpty) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Enter data to\npreview QR code',
            textAlign: TextAlign.center,
            style: TextStyle(color: colorScheme.onSurfaceVariant),
          ),
        ),
      );
    }

    return RepaintBoundary(
      key: repaintKey,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isDark
              ? [
                  BoxShadow(
                    color: Colors.white.withAlpha(15),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: QrImageView(
          data: data,
          version: QrVersions.auto,
          size: size - 24,
          backgroundColor: Colors.white,
          eyeStyle: const QrEyeStyle(
            eyeShape: QrEyeShape.square,
            color: Colors.black,
          ),
          dataModuleStyle: const QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
