import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class UrlParser extends TypedParser {
  static final _schemePattern = RegExp(
    r'^(https?|ftp)://',
    caseSensitive: false,
  );

  static final _domainPattern = RegExp(
    r'^[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])?(\.[a-zA-Z]{2,})+([:/?\#]\S*)?$',
  );

  @override
  ParsedPayload? tryParse(String rawValue) {
    final trimmed = rawValue.trim();
    if (trimmed.isEmpty) return null;

    // Explicit scheme
    if (_schemePattern.hasMatch(trimmed)) {
      // Validate it can be parsed as a URI
      final uri = Uri.tryParse(trimmed);
      if (uri != null && uri.host.isNotEmpty) {
        return UrlPayload(url: trimmed);
      }
      // Even if host parsing is fuzzy, treat as URL if it has a scheme
      return UrlPayload(url: trimmed);
    }

    // Bare domain (example.com, sub.example.com/path)
    if (_domainPattern.hasMatch(trimmed)) {
      return UrlPayload(url: 'https://$trimmed');
    }

    return null;
  }
}
