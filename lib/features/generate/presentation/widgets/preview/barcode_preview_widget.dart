import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/features/generate/domain/models/barcode_format_type.dart';

class BarcodePreviewWidget extends StatelessWidget {
  final String data;
  final BarcodeFormatType format;
  final GlobalKey repaintKey;
  final double width;
  final double height;

  const BarcodePreviewWidget({
    super.key,
    required this.data,
    required this.format,
    required this.repaintKey,
    this.width = 280,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (data.isEmpty) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Enter data to\npreview barcode',
            textAlign: TextAlign.center,
            style: TextStyle(color: colorScheme.onSurfaceVariant),
          ),
        ),
      );
    }

    return RepaintBoundary(
      key: repaintKey,
      child: Container(
        padding: const EdgeInsets.all(16),
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
        child: BarcodeWidget(
          barcode: format.toBarcodeLib(),
          data: data,
          width: width - 32,
          height: height - 32,
          color: Colors.black,
          backgroundColor: Colors.white,
          drawText: true,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
