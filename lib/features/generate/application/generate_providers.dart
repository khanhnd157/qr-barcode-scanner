import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds the current QR payload string being previewed.
final qrPayloadProvider = StateProvider<String>((ref) => '');

/// Holds the current barcode data string being previewed.
final barcodeDataProvider = StateProvider<String>((ref) => '');
