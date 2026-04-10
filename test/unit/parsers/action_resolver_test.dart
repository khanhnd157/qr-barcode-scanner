import 'package:flutter_test/flutter_test.dart';
import 'package:qr_scanner_generator/features/result/domain/action_resolver.dart';
import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';

void main() {
  group('ActionResolver', () {
    test('URL payload has openBrowser, copyUrl, share', () {
      final actions = ActionResolver.resolve(
        UrlPayload(url: 'https://example.com'),
      );
      expect(actions, contains(ResultAction.openBrowser));
      expect(actions, contains(ResultAction.copyUrl));
      expect(actions, contains(ResultAction.share));
      expect(actions.first, ResultAction.openBrowser);
    });

    test('WiFi payload has connectWifi and copyPassword when password present', () {
      final actions = ActionResolver.resolve(
        WifiPayload(ssid: 'Test', password: 'pass123'),
      );
      expect(actions, contains(ResultAction.connectWifi));
      expect(actions, contains(ResultAction.copyPassword));
      expect(actions, contains(ResultAction.share));
    });

    test('WiFi payload omits copyPassword when no password', () {
      final actions = ActionResolver.resolve(
        WifiPayload(ssid: 'Open'),
      );
      expect(actions, contains(ResultAction.connectWifi));
      expect(actions, isNot(contains(ResultAction.copyPassword)));
    });

    test('Contact payload has addContact, call when phone present', () {
      final actions = ActionResolver.resolve(
        ContactPayload(
          fullName: 'John',
          phone: '+123',
          rawVcard: 'BEGIN:VCARD\nEND:VCARD',
        ),
      );
      expect(actions, contains(ResultAction.addContact));
      expect(actions, contains(ResultAction.call));
      expect(actions.first, ResultAction.addContact);
    });

    test('Contact payload omits call/email when not present', () {
      final actions = ActionResolver.resolve(
        ContactPayload(fullName: 'John', rawVcard: 'BEGIN:VCARD\nEND:VCARD'),
      );
      expect(actions, contains(ResultAction.addContact));
      expect(actions, isNot(contains(ResultAction.call)));
      expect(actions, isNot(contains(ResultAction.sendEmail)));
    });

    test('Phone payload has call, sendSms, copyNumber', () {
      final actions = ActionResolver.resolve(
        PhonePayload(number: '+1234567890'),
      );
      expect(actions, contains(ResultAction.call));
      expect(actions, contains(ResultAction.sendSms));
      expect(actions, contains(ResultAction.copyNumber));
    });

    test('Email payload has sendEmail as primary', () {
      final actions = ActionResolver.resolve(
        EmailPayload(address: 'test@example.com'),
      );
      expect(actions.first, ResultAction.sendEmail);
    });

    test('SMS payload has sendSms as primary', () {
      final actions = ActionResolver.resolve(
        SmsPayload(number: '+123'),
      );
      expect(actions.first, ResultAction.sendSms);
    });

    test('Geo payload has openMaps as primary', () {
      final actions = ActionResolver.resolve(
        GeoPayload(latitude: 10.0, longitude: 106.0),
      );
      expect(actions.first, ResultAction.openMaps);
    });

    test('Calendar payload has addCalendar as primary', () {
      final actions = ActionResolver.resolve(
        CalendarPayload(summary: 'Meeting'),
      );
      expect(actions.first, ResultAction.addCalendar);
    });

    test('Product payload has searchWeb as primary', () {
      final actions = ActionResolver.resolve(
        ProductPayload(code: '5901234123457'),
      );
      expect(actions.first, ResultAction.searchWeb);
    });

    test('Text payload has copyText and share', () {
      final actions = ActionResolver.resolve(
        TextPayload(text: 'hello'),
      );
      expect(actions, contains(ResultAction.copyText));
      expect(actions, contains(ResultAction.share));
      expect(actions.length, 2);
    });
  });
}
