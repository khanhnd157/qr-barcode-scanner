import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_generator/shared/enums/code_format.dart';

class FormatMapper {
  static CodeFormat fromMobileScanner(BarcodeFormat format) {
    return switch (format) {
      BarcodeFormat.qrCode => CodeFormat.qr,
      BarcodeFormat.ean13 => CodeFormat.ean13,
      BarcodeFormat.ean8 => CodeFormat.ean8,
      BarcodeFormat.upcA => CodeFormat.upcA,
      BarcodeFormat.upcE => CodeFormat.upcE,
      BarcodeFormat.code39 => CodeFormat.code39,
      BarcodeFormat.code93 => CodeFormat.code93,
      BarcodeFormat.code128 => CodeFormat.code128,
      BarcodeFormat.itf14 => CodeFormat.itf,
      BarcodeFormat.codabar => CodeFormat.codabar,
      BarcodeFormat.pdf417 => CodeFormat.pdf417,
      BarcodeFormat.dataMatrix => CodeFormat.dataMatrix,
      BarcodeFormat.aztec => CodeFormat.aztec,
      _ => CodeFormat.unknown,
    };
  }
}
