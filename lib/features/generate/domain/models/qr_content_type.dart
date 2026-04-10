import 'package:flutter/material.dart';

enum QrContentType {
  text('Text', Icons.text_fields, 'text'),
  url('URL', Icons.language, 'url'),
  wifi('Wi-Fi', Icons.wifi, 'wifi'),
  contact('Contact/VCard', Icons.contacts, 'contact'),
  email('Email', Icons.alternate_email, 'email'),
  phone('Phone', Icons.phone, 'phone'),
  sms('SMS', Icons.sms, 'sms'),
  location('Geolocation', Icons.location_on, 'location'),
  event('Calendar', Icons.calendar_today, 'event'),
  clipboard('Clipboard', Icons.content_paste, 'clipboard'),
  app('Application', Icons.apps, 'app');

  const QrContentType(this.label, this.icon, this.routeName);

  final String label;
  final IconData icon;
  final String routeName;

  static QrContentType fromName(String name) {
    return QrContentType.values.firstWhere(
      (e) => e.routeName == name,
      orElse: () => QrContentType.text,
    );
  }
}
