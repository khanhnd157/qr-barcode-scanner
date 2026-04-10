import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class WifiParser extends TypedParser {
  @override
  ParsedPayload? tryParse(String rawValue) {
    final trimmed = rawValue.trim();
    if (!trimmed.startsWith('WIFI:')) return null;

    final content = trimmed.substring(5);
    String? ssid;
    String? password;
    String encryption = 'nopass';
    bool hidden = false;

    // Parse key:value pairs separated by semicolons
    // Handle escaped semicolons (\;)
    final fields = _splitFields(content);

    for (final field in fields) {
      final colonIndex = field.indexOf(':');
      if (colonIndex < 0) continue;
      final key = field.substring(0, colonIndex).toUpperCase();
      final value = field.substring(colonIndex + 1);

      switch (key) {
        case 'S':
          ssid = _unescape(value);
        case 'P':
          password = _unescape(value);
        case 'T':
          encryption = value.toUpperCase();
        case 'H':
          hidden = value.toLowerCase() == 'true';
      }
    }

    if (ssid == null || ssid.isEmpty) return null;

    return WifiPayload(
      ssid: ssid,
      password: password,
      encryptionType: encryption,
      hidden: hidden,
    );
  }

  List<String> _splitFields(String content) {
    final fields = <String>[];
    final buffer = StringBuffer();

    for (int i = 0; i < content.length; i++) {
      if (content[i] == '\\' && i + 1 < content.length) {
        buffer.write(content[i + 1]);
        i++;
      } else if (content[i] == ';') {
        if (buffer.isNotEmpty) {
          fields.add(buffer.toString());
          buffer.clear();
        }
      } else {
        buffer.write(content[i]);
      }
    }
    if (buffer.isNotEmpty) {
      fields.add(buffer.toString());
    }
    return fields;
  }

  String _unescape(String value) {
    return value
        .replaceAll(r'\;', ';')
        .replaceAll(r'\:', ':')
        .replaceAll(r'\\', r'\');
  }
}
