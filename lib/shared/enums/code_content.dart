import 'package:flutter/material.dart';

enum CodeContent {
  text('Text', Icons.text_fields),
  url('URL', Icons.language),
  phone('Phone', Icons.phone),
  email('Email', Icons.alternate_email),
  wifi('Wi-Fi', Icons.wifi),
  contact('Contact/VCard', Icons.contacts),
  sms('SMS', Icons.sms),
  geo('Geolocation', Icons.location_on),
  calendar('Calendar', Icons.calendar_today),
  product('Product', Icons.shopping_cart),
  clipboard('Clipboard', Icons.content_paste),
  app('Application', Icons.apps);

  const CodeContent(this.label, this.icon);

  final String label;
  final IconData icon;
}
