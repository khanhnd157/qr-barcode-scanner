import 'package:qr_scanner_generator/shared/enums/code_content.dart';

sealed class ParsedPayload {
  String get displayTitle;
  String get displaySubtitle;
  CodeContent get contentType;
}

class TextPayload extends ParsedPayload {
  final String text;

  TextPayload({required this.text});

  @override
  String get displayTitle =>
      text.length > 50 ? '${text.substring(0, 50)}...' : text;

  @override
  String get displaySubtitle => 'Plain text';

  @override
  CodeContent get contentType => CodeContent.text;
}

class UrlPayload extends ParsedPayload {
  final String url;

  UrlPayload({required this.url});

  @override
  String get displayTitle {
    try {
      final uri = Uri.parse(url);
      return uri.host.isNotEmpty ? uri.host : url;
    } catch (_) {
      return url;
    }
  }

  @override
  String get displaySubtitle => url;

  @override
  CodeContent get contentType => CodeContent.url;
}

class PhonePayload extends ParsedPayload {
  final String number;

  PhonePayload({required this.number});

  @override
  String get displayTitle => number;

  @override
  String get displaySubtitle => 'Phone number';

  @override
  CodeContent get contentType => CodeContent.phone;
}

class EmailPayload extends ParsedPayload {
  final String address;
  final String? subject;
  final String? body;

  EmailPayload({required this.address, this.subject, this.body});

  @override
  String get displayTitle => address;

  @override
  String get displaySubtitle => subject ?? 'Email address';

  @override
  CodeContent get contentType => CodeContent.email;
}

class WifiPayload extends ParsedPayload {
  final String ssid;
  final String? password;
  final String encryptionType;
  final bool hidden;

  WifiPayload({
    required this.ssid,
    this.password,
    this.encryptionType = 'WPA',
    this.hidden = false,
  });

  @override
  String get displayTitle => ssid;

  @override
  String get displaySubtitle => 'Wi-Fi Network ($encryptionType)';

  @override
  CodeContent get contentType => CodeContent.wifi;
}

class ContactPayload extends ParsedPayload {
  final String? fullName;
  final String? phone;
  final String? email;
  final String? organization;
  final String? address;
  final String? website;
  final String? note;
  final String rawVcard;

  ContactPayload({
    this.fullName,
    this.phone,
    this.email,
    this.organization,
    this.address,
    this.website,
    this.note,
    required this.rawVcard,
  });

  @override
  String get displayTitle => fullName ?? 'Unknown Contact';

  @override
  String get displaySubtitle =>
      organization ?? phone ?? email ?? 'Contact';

  @override
  CodeContent get contentType => CodeContent.contact;
}

class SmsPayload extends ParsedPayload {
  final String number;
  final String? message;

  SmsPayload({required this.number, this.message});

  @override
  String get displayTitle => number;

  @override
  String get displaySubtitle => message ?? 'SMS';

  @override
  CodeContent get contentType => CodeContent.sms;
}

class GeoPayload extends ParsedPayload {
  final double latitude;
  final double longitude;
  final String? label;

  GeoPayload({
    required this.latitude,
    required this.longitude,
    this.label,
  });

  @override
  String get displayTitle =>
      label ?? '${latitude.toStringAsFixed(6)}, ${longitude.toStringAsFixed(6)}';

  @override
  String get displaySubtitle => 'Location';

  @override
  CodeContent get contentType => CodeContent.geo;
}

class CalendarPayload extends ParsedPayload {
  final String? summary;
  final DateTime? dtStart;
  final DateTime? dtEnd;
  final String? location;
  final String? description;

  CalendarPayload({
    this.summary,
    this.dtStart,
    this.dtEnd,
    this.location,
    this.description,
  });

  @override
  String get displayTitle => summary ?? 'Event';

  @override
  String get displaySubtitle => location ?? 'Calendar event';

  @override
  CodeContent get contentType => CodeContent.calendar;
}

class ProductPayload extends ParsedPayload {
  final String code;

  ProductPayload({required this.code});

  @override
  String get displayTitle => code;

  @override
  String get displaySubtitle => 'Product barcode';

  @override
  CodeContent get contentType => CodeContent.product;
}
