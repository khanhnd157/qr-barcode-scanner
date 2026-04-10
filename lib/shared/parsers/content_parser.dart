import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/wifi_parser.dart';
import 'package:qr_scanner_generator/shared/parsers/contact_parser.dart';
import 'package:qr_scanner_generator/shared/parsers/calendar_parser.dart';
import 'package:qr_scanner_generator/shared/parsers/email_parser.dart';
import 'package:qr_scanner_generator/shared/parsers/phone_parser.dart';
import 'package:qr_scanner_generator/shared/parsers/sms_parser.dart';
import 'package:qr_scanner_generator/shared/parsers/geo_parser.dart';
import 'package:qr_scanner_generator/shared/parsers/url_parser.dart';
import 'package:qr_scanner_generator/shared/parsers/product_parser.dart';

abstract class TypedParser {
  ParsedPayload? tryParse(String rawValue);
}

class ContentParser {
  static final List<TypedParser> _parsers = [
    WifiParser(),
    ContactParser(),
    CalendarParser(),
    EmailParser(),
    PhoneParser(),
    SmsParser(),
    GeoParser(),
    UrlParser(),
    ProductParser(),
  ];

  static ParsedPayload parse(String rawValue) {
    for (final parser in _parsers) {
      final result = parser.tryParse(rawValue);
      if (result != null) return result;
    }
    return TextPayload(text: rawValue);
  }
}
