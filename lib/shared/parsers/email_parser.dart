import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class EmailParser extends TypedParser {
  @override
  ParsedPayload? tryParse(String rawValue) {
    final trimmed = rawValue.trim();

    // mailto: scheme
    if (trimmed.toLowerCase().startsWith('mailto:')) {
      return _parseMailto(trimmed);
    }

    // MATMSG: format (used by some QR generators)
    if (trimmed.toUpperCase().startsWith('MATMSG:')) {
      return _parseMatmsg(trimmed);
    }

    return null;
  }

  EmailPayload? _parseMailto(String raw) {
    final uri = Uri.tryParse(raw);
    if (uri == null) return null;

    final address = uri.path;
    if (address.isEmpty) return null;

    final subject = uri.queryParameters['subject'];
    final body = uri.queryParameters['body'];

    return EmailPayload(
      address: address,
      subject: subject,
      body: body,
    );
  }

  EmailPayload? _parseMatmsg(String raw) {
    final content = raw.substring(7);
    String? to;
    String? subject;
    String? body;

    final fields = content.split(';');
    for (final field in fields) {
      final colonIndex = field.indexOf(':');
      if (colonIndex < 0) continue;
      final key = field.substring(0, colonIndex).toUpperCase();
      final value = field.substring(colonIndex + 1);

      switch (key) {
        case 'TO':
          to = value;
        case 'SUB':
          subject = value;
        case 'BODY':
          body = value;
      }
    }

    if (to == null || to.isEmpty) return null;

    return EmailPayload(
      address: to,
      subject: subject,
      body: body,
    );
  }
}
