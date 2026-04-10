import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class ProductParser extends TypedParser {
  // EAN-8 (8 digits), UPC-A (12 digits), EAN-13 (13 digits)
  static final _productPattern = RegExp(r'^\d{8}$|^\d{12}$|^\d{13}$');

  @override
  ParsedPayload? tryParse(String rawValue) {
    final trimmed = rawValue.trim();
    if (!_productPattern.hasMatch(trimmed)) return null;
    return ProductPayload(code: trimmed);
  }
}
