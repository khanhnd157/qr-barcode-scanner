import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class GeoParser extends TypedParser {
  static final _geoPattern = RegExp(
    r'^geo:(-?\d+\.?\d*),(-?\d+\.?\d*)',
    caseSensitive: false,
  );

  @override
  ParsedPayload? tryParse(String rawValue) {
    final trimmed = rawValue.trim();
    final match = _geoPattern.firstMatch(trimmed);
    if (match == null) return null;

    final lat = double.tryParse(match.group(1)!);
    final lon = double.tryParse(match.group(2)!);
    if (lat == null || lon == null) return null;

    // Extract optional label from query parameter
    String? label;
    final queryIndex = trimmed.indexOf('?');
    if (queryIndex >= 0) {
      final query = trimmed.substring(queryIndex + 1);
      final params = Uri.splitQueryString(query);
      label = params['q'] ?? params['label'];
    }

    return GeoPayload(
      latitude: lat,
      longitude: lon,
      label: label,
    );
  }
}
