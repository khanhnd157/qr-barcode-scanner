import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  static Future<bool> openUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<bool> call(String number) async {
    final uri = Uri.parse('tel:$number');
    return launchUrl(uri);
  }

  static Future<bool> sendEmail(
    String address, {
    String? subject,
    String? body,
  }) async {
    final uri = Uri(
      scheme: 'mailto',
      path: address,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );
    return launchUrl(uri);
  }

  static Future<bool> sendSms(String number, {String? body}) async {
    final uri = Uri.parse('sms:$number${body != null ? '?body=$body' : ''}');
    return launchUrl(uri);
  }

  static Future<bool> openMap(double lat, double lon) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lon',
    );
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Opens Wi-Fi settings on Android, or general settings on iOS.
  static Future<bool> openWifiSettings() async {
    if (Platform.isAndroid) {
      final uri = Uri.parse('android.settings.WIFI_SETTINGS');
      try {
        return await launchUrl(uri);
      } catch (_) {
        // Fallback: open general Android settings
        return launchUrl(Uri.parse('android.settings.SETTINGS'));
      }
    }
    return openUrl('app-settings:');
  }

  /// Launches an Android intent to add a contact via vCard data.
  /// On iOS, this copies data and shows a message.
  static Future<bool> addContactFromVcard(String vcardData) async {
    // Use data: URI to open VCard in contacts app
    final encoded = Uri.encodeComponent(vcardData);
    final uri = Uri.parse(
      'data:text/x-vcard;charset=utf-8,$encoded',
    );
    try {
      return await launchUrl(uri);
    } catch (_) {
      return false;
    }
  }

  /// Launches calendar intent for adding an event.
  static Future<bool> addCalendarEvent({
    required String title,
    DateTime? begin,
    DateTime? end,
    String? location,
    String? description,
  }) async {
    // Use content://com.android.calendar intent pattern on Android
    // Fallback: use a webcal or Google Calendar URL
    final params = <String, String>{
      'action': 'TEMPLATE',
      'text': title,
      if (location != null) 'location': location,
      if (description != null) 'details': description,
    };

    if (begin != null) {
      params['dates'] =
          '${_toGoogleCalDate(begin)}/${_toGoogleCalDate(end ?? begin.add(const Duration(hours: 1)))}';
    }

    final uri = Uri.https(
      'calendar.google.com',
      '/calendar/render',
      params,
    );
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static String _toGoogleCalDate(DateTime dt) {
    return '${dt.year}'
        '${dt.month.toString().padLeft(2, '0')}'
        '${dt.day.toString().padLeft(2, '0')}'
        'T'
        '${dt.hour.toString().padLeft(2, '0')}'
        '${dt.minute.toString().padLeft(2, '0')}'
        '00Z';
  }
}
