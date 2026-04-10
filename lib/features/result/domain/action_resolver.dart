import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';

enum ResultAction {
  openBrowser('Open in Browser', Icons.open_in_browser),
  copyUrl('Copy URL', Icons.copy),
  copyText('Copy', Icons.copy),
  copyPassword('Copy Password', Icons.key),
  copyNumber('Copy Number', Icons.copy),
  share('Share', Icons.share),
  call('Call', Icons.call),
  sendEmail('Send Email', Icons.email),
  sendSms('Send SMS', Icons.sms),
  addContact('Add Contact', Icons.person_add),
  openMaps('Open in Maps', Icons.map),
  addCalendar('Add to Calendar', Icons.calendar_month),
  searchWeb('Search Web', Icons.search),
  connectWifi('Wi-Fi Settings', Icons.wifi);

  const ResultAction(this.label, this.icon);

  final String label;
  final IconData icon;
}

class ActionResolver {
  static List<ResultAction> resolve(ParsedPayload payload) {
    return switch (payload) {
      UrlPayload() => [
          ResultAction.openBrowser,
          ResultAction.copyUrl,
          ResultAction.share,
        ],
      WifiPayload(:final password) => [
          ResultAction.connectWifi,
          if (password != null && password.isNotEmpty)
            ResultAction.copyPassword,
          ResultAction.copyText,
          ResultAction.share,
        ],
      ContactPayload(:final phone, :final email) => [
          ResultAction.addContact,
          if (phone != null) ResultAction.call,
          if (email != null) ResultAction.sendEmail,
          ResultAction.share,
        ],
      PhonePayload() => [
          ResultAction.call,
          ResultAction.sendSms,
          ResultAction.copyNumber,
          ResultAction.share,
        ],
      EmailPayload() => [
          ResultAction.sendEmail,
          ResultAction.copyText,
          ResultAction.share,
        ],
      SmsPayload() => [
          ResultAction.sendSms,
          ResultAction.copyText,
          ResultAction.share,
        ],
      GeoPayload() => [
          ResultAction.openMaps,
          ResultAction.copyText,
          ResultAction.share,
        ],
      CalendarPayload() => [
          ResultAction.addCalendar,
          ResultAction.copyText,
          ResultAction.share,
        ],
      ProductPayload() => [
          ResultAction.searchWeb,
          ResultAction.copyText,
          ResultAction.share,
        ],
      TextPayload() => [
          ResultAction.copyText,
          ResultAction.share,
        ],
    };
  }
}
