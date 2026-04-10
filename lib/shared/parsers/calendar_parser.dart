import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class CalendarParser extends TypedParser {
  @override
  ParsedPayload? tryParse(String rawValue) {
    final trimmed = rawValue.trim();
    if (!trimmed.toUpperCase().contains('BEGIN:VEVENT')) return null;

    String? summary;
    DateTime? dtStart;
    DateTime? dtEnd;
    String? location;
    String? description;

    // Unfold continuation lines
    final unfolded = trimmed.replaceAll(RegExp(r'\r?\n[ \t]'), '');
    final lines = unfolded.split(RegExp(r'\r?\n'));

    for (final line in lines) {
      final upperLine = line.toUpperCase();

      if (upperLine.startsWith('SUMMARY:') ||
          upperLine.startsWith('SUMMARY;')) {
        summary = _extractValue(line);
      } else if (upperLine.startsWith('DTSTART:') ||
          upperLine.startsWith('DTSTART;')) {
        dtStart = _parseDateTime(line);
      } else if (upperLine.startsWith('DTEND:') ||
          upperLine.startsWith('DTEND;')) {
        dtEnd = _parseDateTime(line);
      } else if (upperLine.startsWith('LOCATION:') ||
          upperLine.startsWith('LOCATION;')) {
        location = _extractValue(line);
      } else if (upperLine.startsWith('DESCRIPTION:') ||
          upperLine.startsWith('DESCRIPTION;')) {
        description = _extractValue(line)
            .replaceAll(r'\n', '\n')
            .replaceAll(r'\,', ',');
      }
    }

    return CalendarPayload(
      summary: summary,
      dtStart: dtStart,
      dtEnd: dtEnd,
      location: location,
      description: description,
    );
  }

  String _extractValue(String line) {
    final colonIndex = line.indexOf(':');
    if (colonIndex < 0) return line;
    return line.substring(colonIndex + 1).trim();
  }

  DateTime? _parseDateTime(String line) {
    final colonIndex = line.indexOf(':');
    if (colonIndex < 0) return null;
    final value = line.substring(colonIndex + 1).trim();

    // Full datetime: 20201122T220900Z or 20201122T220900
    final fullMatch = RegExp(r'(\d{4})(\d{2})(\d{2})T(\d{2})(\d{2})(\d{2})')
        .firstMatch(value);
    if (fullMatch != null) {
      return DateTime(
        int.parse(fullMatch.group(1)!),
        int.parse(fullMatch.group(2)!),
        int.parse(fullMatch.group(3)!),
        int.parse(fullMatch.group(4)!),
        int.parse(fullMatch.group(5)!),
        int.parse(fullMatch.group(6)!),
      );
    }

    // Date-only: 20201122
    final dateMatch = RegExp(r'^(\d{4})(\d{2})(\d{2})$').firstMatch(value);
    if (dateMatch != null) {
      return DateTime(
        int.parse(dateMatch.group(1)!),
        int.parse(dateMatch.group(2)!),
        int.parse(dateMatch.group(3)!),
      );
    }

    return null;
  }
}
