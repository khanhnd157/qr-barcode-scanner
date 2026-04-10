import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/shared/enums/code_content.dart';

class CodeTypeIcon extends StatelessWidget {
  final CodeContent contentType;
  final double size;

  const CodeTypeIcon({
    super.key,
    required this.contentType,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(size * 0.25),
      ),
      child: Icon(
        contentType.icon,
        color: colorScheme.onPrimaryContainer,
        size: size * 0.55,
      ),
    );
  }
}
