import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class PhoneParser extends TypedParser {
  // tel: scheme is unambiguous
  static final _telScheme = RegExp(r'^tel:', caseSensitive: false);

  // Standalone phone: must start with + or ( to distinguish from product codes
  // Pure digit strings like 5901234123457 should NOT match here (they match ProductParser)
  static final _phoneWithPrefix = RegExp(
    r'^\+[\d\s\-().]{6,19}$',
  );
  static final _phoneWithParens = RegExp(
    r'^\([\d]{1,4}\)[\s\-]?[\d\s\-]{4,15}$',
  );

  @override
  ParsedPayload? tryParse(String rawValue) {
    final trimmed = rawValue.trim();

    // tel: scheme — always phone
    if (_telScheme.hasMatch(trimmed)) {
      final number = trimmed.replaceFirst(_telScheme, '').trim();
      if (number.isNotEmpty) {
        return PhonePayload(number: number);
      }
    }

    // + prefix international numbers: +1234567890
    if (_phoneWithPrefix.hasMatch(trimmed)) {
      return PhonePayload(number: trimmed);
    }

    // Parenthesized area code: (123) 456-7890
    if (_phoneWithParens.hasMatch(trimmed)) {
      return PhonePayload(number: trimmed);
    }

    return null;
  }
}
