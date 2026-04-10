import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class ContactParser extends TypedParser {
  @override
  ParsedPayload? tryParse(String rawValue) {
    final trimmed = rawValue.trim();

    if (trimmed.toUpperCase().startsWith('BEGIN:VCARD')) {
      return _parseVcard(trimmed);
    }
    if (trimmed.toUpperCase().startsWith('MECARD:')) {
      return _parseMecard(trimmed);
    }
    return null;
  }

  ContactPayload? _parseVcard(String raw) {
    String? fnName;
    String? nName;
    final phones = <String>[];
    final emails = <String>[];
    String? org;
    String? address;
    String? website;
    String? note;

    // Unfold lines (continuation lines start with space or tab)
    final unfolded = raw.replaceAll(RegExp(r'\r?\n[ \t]'), '');
    final lines = unfolded.split(RegExp(r'\r?\n'));

    for (final line in lines) {
      final upperLine = line.toUpperCase();

      // FN (formatted name) — preferred
      if (upperLine.startsWith('FN:') || upperLine.startsWith('FN;')) {
        fnName ??= _extractValue(line);
      }
      // N (structured name) — fallback
      else if (upperLine.startsWith('N:') || upperLine.startsWith('N;')) {
        final parts = _extractValue(line).split(';');
        if (parts.length >= 2) {
          final lastName = parts[0].trim();
          final firstName = parts[1].trim();
          final combined = '$firstName $lastName'.trim();
          if (combined.isNotEmpty) nName = combined;
        } else if (parts[0].trim().isNotEmpty) {
          nName = parts[0].trim();
        }
      }
      // Phone — collect all, use first
      else if (upperLine.startsWith('TEL:') ||
          upperLine.startsWith('TEL;')) {
        final val = _extractValue(line);
        if (val.isNotEmpty) phones.add(val);
      }
      // Email — collect all, use first
      else if (upperLine.startsWith('EMAIL:') ||
          upperLine.startsWith('EMAIL;')) {
        final val = _extractValue(line);
        if (val.isNotEmpty) emails.add(val);
      }
      // Organization
      else if (upperLine.startsWith('ORG:') ||
          upperLine.startsWith('ORG;')) {
        org = _extractValue(line)
            .split(';')
            .where((p) => p.trim().isNotEmpty)
            .join(', ');
      }
      // Address — structured, semi-colon separated
      else if (upperLine.startsWith('ADR:') ||
          upperLine.startsWith('ADR;')) {
        final adrParts = _extractValue(line).split(';');
        final joined =
            adrParts.where((p) => p.trim().isNotEmpty).join(', ');
        if (joined.isNotEmpty) address = joined;
      }
      // URL
      else if (upperLine.startsWith('URL:') ||
          upperLine.startsWith('URL;')) {
        website ??= _extractValue(line);
      }
      // Note
      else if (upperLine.startsWith('NOTE:') ||
          upperLine.startsWith('NOTE;')) {
        note = _extractValue(line)
            .replaceAll(r'\n', '\n')
            .replaceAll(r'\,', ',');
      }
    }

    final name = fnName ?? nName;

    return ContactPayload(
      fullName: name,
      phone: phones.isNotEmpty ? phones.first : null,
      email: emails.isNotEmpty ? emails.first : null,
      organization: org,
      address: address,
      website: website,
      note: note,
      rawVcard: raw,
    );
  }

  ContactPayload? _parseMecard(String raw) {
    final content = raw.substring(7); // Remove "MECARD:"
    String? name;
    String? phone;
    String? email;
    String? org;
    String? address;
    String? website;
    String? note;

    final fields = _splitMecardFields(content);
    for (final field in fields) {
      final colonIndex = field.indexOf(':');
      if (colonIndex < 0) continue;
      final key = field.substring(0, colonIndex).toUpperCase();
      final value = field.substring(colonIndex + 1).trim();
      if (value.isEmpty) continue;

      switch (key) {
        case 'N':
          final parts = value.split(',');
          if (parts.length >= 2) {
            name = '${parts[1].trim()} ${parts[0].trim()}'.trim();
          } else {
            name = value;
          }
        case 'TEL':
          phone ??= value;
        case 'EMAIL':
          email ??= value;
        case 'ORG':
          org = value;
        case 'ADR':
          address = value.replaceAll(',', ', ');
        case 'URL':
          website = value;
        case 'NOTE':
          note = value;
      }
    }

    return ContactPayload(
      fullName: name,
      phone: phone,
      email: email,
      organization: org,
      address: address,
      website: website,
      note: note,
      rawVcard: raw,
    );
  }

  String _extractValue(String line) {
    // Handle properties with parameters like TEL;TYPE=CELL:+123
    final colonIndex = line.indexOf(':');
    if (colonIndex < 0) return line;
    return line.substring(colonIndex + 1).trim();
  }

  List<String> _splitMecardFields(String content) {
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
}
