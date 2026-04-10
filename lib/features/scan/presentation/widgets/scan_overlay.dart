import 'package:flutter/material.dart';

class ScanOverlay extends StatefulWidget {
  const ScanOverlay({super.key});

  @override
  State<ScanOverlay> createState() => _ScanOverlayState();
}

class _ScanOverlayState extends State<ScanOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: _ScanOverlayPainter(
            scanLineProgress: _animation.value,
            borderColor: Theme.of(context).colorScheme.primary,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _ScanOverlayPainter extends CustomPainter {
  final double scanLineProgress;
  final Color borderColor;

  _ScanOverlayPainter({
    required this.scanLineProgress,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cutoutSize = size.width * 0.7;
    final left = (size.width - cutoutSize) / 2;
    final top = (size.height - cutoutSize) / 2;
    final cutoutRect = Rect.fromLTWH(left, top, cutoutSize, cutoutSize);

    // Semi-transparent overlay with cutout
    final overlayPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(
        RRect.fromRectAndRadius(cutoutRect, const Radius.circular(12)),
      )
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(
      overlayPath,
      Paint()..color = Colors.black.withAlpha(140),
    );

    // Corner brackets
    final cornerLength = cutoutSize * 0.12;
    const cornerWidth = 3.5;
    final cornerPaint = Paint()
      ..color = borderColor
      ..strokeWidth = cornerWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Top-left
    canvas.drawLine(
      Offset(left, top + cornerLength),
      Offset(left, top),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left, top),
      Offset(left + cornerLength, top),
      cornerPaint,
    );

    // Top-right
    canvas.drawLine(
      Offset(left + cutoutSize - cornerLength, top),
      Offset(left + cutoutSize, top),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left + cutoutSize, top),
      Offset(left + cutoutSize, top + cornerLength),
      cornerPaint,
    );

    // Bottom-left
    canvas.drawLine(
      Offset(left, top + cutoutSize - cornerLength),
      Offset(left, top + cutoutSize),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left, top + cutoutSize),
      Offset(left + cornerLength, top + cutoutSize),
      cornerPaint,
    );

    // Bottom-right
    canvas.drawLine(
      Offset(left + cutoutSize - cornerLength, top + cutoutSize),
      Offset(left + cutoutSize, top + cutoutSize),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left + cutoutSize, top + cutoutSize - cornerLength),
      Offset(left + cutoutSize, top + cutoutSize),
      cornerPaint,
    );

    // Scan line
    final lineY = top + (cutoutSize * scanLineProgress);
    final linePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          borderColor.withAlpha(0),
          borderColor.withAlpha(180),
          borderColor.withAlpha(0),
        ],
      ).createShader(
        Rect.fromLTWH(left, lineY - 1, cutoutSize, 2),
      )
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(left + 8, lineY),
      Offset(left + cutoutSize - 8, lineY),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(_ScanOverlayPainter oldDelegate) {
    return oldDelegate.scanLineProgress != scanLineProgress;
  }
}
