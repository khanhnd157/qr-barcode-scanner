/// Builds QR-encodable payload strings for each content type.
class QrGeneratorService {
  static String buildText(String text) => text;

  static String buildUrl(String url) {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      return 'https://$url';
    }
    return url;
  }

  static String buildPhone(String number) => 'tel:$number';

  static String buildEmail({
    required String address,
    String? subject,
    String? body,
  }) {
    final params = <String>[];
    if (subject != null && subject.isNotEmpty) {
      params.add('subject=${Uri.encodeComponent(subject)}');
    }
    if (body != null && body.isNotEmpty) {
      params.add('body=${Uri.encodeComponent(body)}');
    }
    final query = params.isNotEmpty ? '?${params.join('&')}' : '';
    return 'mailto:$address$query';
  }

  static String buildSms({required String number, String? message}) {
    if (message != null && message.isNotEmpty) {
      return 'smsto:$number:$message';
    }
    return 'smsto:$number';
  }

  static String buildWifi({
    required String ssid,
    String? password,
    String encryption = 'WPA',
    bool hidden = false,
  }) {
    final escapedSsid = _escapeWifi(ssid);
    final escapedPass =
        password != null ? _escapeWifi(password) : '';
    return 'WIFI:T:$encryption;S:$escapedSsid;P:$escapedPass;H:${hidden ? 'true' : 'false'};;';
  }

  static String buildContact({
    String? name,
    String? phone,
    String? email,
    String? organization,
    String? address,
    String? website,
    String? note,
  }) {
    final lines = <String>['BEGIN:VCARD', 'VERSION:3.0'];
    if (name != null && name.isNotEmpty) {
      lines.add('FN:$name');
      // Try to split into last;first for N field
      final parts = name.split(' ');
      if (parts.length >= 2) {
        lines.add('N:${parts.last};${parts.sublist(0, parts.length - 1).join(' ')}');
      } else {
        lines.add('N:$name');
      }
    }
    if (organization != null && organization.isNotEmpty) {
      lines.add('ORG:$organization');
    }
    if (phone != null && phone.isNotEmpty) {
      lines.add('TEL:$phone');
    }
    if (email != null && email.isNotEmpty) {
      lines.add('EMAIL:$email');
    }
    if (address != null && address.isNotEmpty) {
      lines.add('ADR:;;$address;;;;');
    }
    if (website != null && website.isNotEmpty) {
      lines.add('URL:$website');
    }
    if (note != null && note.isNotEmpty) {
      lines.add('NOTE:$note');
    }
    lines.add('END:VCARD');
    return lines.join('\n');
  }

  static String buildLocation({
    required double latitude,
    required double longitude,
    String? label,
  }) {
    final base = 'geo:$latitude,$longitude';
    if (label != null && label.isNotEmpty) {
      return '$base?q=${Uri.encodeComponent(label)}';
    }
    return base;
  }

  static String buildEvent({
    required String title,
    DateTime? start,
    DateTime? end,
    String? location,
    String? description,
  }) {
    final lines = <String>['BEGIN:VEVENT'];
    lines.add('SUMMARY:$title');
    if (start != null) {
      lines.add('DTSTART:${_formatDateTime(start)}');
    }
    if (end != null) {
      lines.add('DTEND:${_formatDateTime(end)}');
    }
    if (location != null && location.isNotEmpty) {
      lines.add('LOCATION:$location');
    }
    if (description != null && description.isNotEmpty) {
      lines.add('DESCRIPTION:$description');
    }
    lines.add('END:VEVENT');
    return lines.join('\n');
  }

  static String _escapeWifi(String value) {
    return value
        .replaceAll(r'\', r'\\')
        .replaceAll(';', r'\;')
        .replaceAll(':', r'\:');
  }

  static String _formatDateTime(DateTime dt) {
    return '${dt.year}'
        '${dt.month.toString().padLeft(2, '0')}'
        '${dt.day.toString().padLeft(2, '0')}'
        'T'
        '${dt.hour.toString().padLeft(2, '0')}'
        '${dt.minute.toString().padLeft(2, '0')}'
        '${dt.second.toString().padLeft(2, '0')}';
  }
}
