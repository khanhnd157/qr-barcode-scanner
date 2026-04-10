import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class SmsParser extends TypedParser {
  static final _smsPattern = RegExp(
    r'^(sms|smsto):',
    caseSensitive: false,
  );

  @override
  ParsedPayload? tryParse(String rawValue) {
    final trimmed = rawValue.trim();
    if (!_smsPattern.hasMatch(trimmed)) return null;

    final content = trimmed.replaceFirst(_smsPattern, '');

    // Format: number:message or number?body=message
    String number;
    String? message;

    if (content.contains('?')) {
      final parts = content.split('?');
      number = parts[0];
      final query = Uri.tryParse('sms:$content')?.queryParameters;
      message = query?['body'];
    } else if (content.contains(':')) {
      final colonIndex = content.indexOf(':');
      number = content.substring(0, colonIndex);
      message = content.substring(colonIndex + 1);
    } else {
      number = content;
    }

    if (number.isEmpty) return null;

    return SmsPayload(number: number, message: message);
  }
}
