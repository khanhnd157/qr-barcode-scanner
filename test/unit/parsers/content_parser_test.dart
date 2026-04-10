import 'package:flutter_test/flutter_test.dart';
import 'package:qr_scanner_generator/shared/enums/code_content.dart';
import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

void main() {
  group('ContentParser', () {
    // -----------------------------------------------------------------------
    // URL
    // -----------------------------------------------------------------------
    group('URL parsing', () {
      test('parses https URL', () {
        final result = ContentParser.parse('https://example.com');
        expect(result, isA<UrlPayload>());
        expect((result as UrlPayload).url, 'https://example.com');
      });

      test('parses http URL', () {
        final result = ContentParser.parse('http://example.com/path?q=1');
        expect(result, isA<UrlPayload>());
      });

      test('parses bare domain', () {
        final result = ContentParser.parse('example.com');
        expect(result, isA<UrlPayload>());
        expect((result as UrlPayload).url, 'https://example.com');
      });

      test('parses domain with path', () {
        final result = ContentParser.parse('example.com/path/to/page');
        expect(result, isA<UrlPayload>());
      });
    });

    // -----------------------------------------------------------------------
    // Wi-Fi
    // -----------------------------------------------------------------------
    group('WiFi parsing', () {
      test('parses standard WiFi string', () {
        final result =
            ContentParser.parse('WIFI:T:WPA;S:MyNetwork;P:MyPass123;;');
        expect(result, isA<WifiPayload>());
        final wifi = result as WifiPayload;
        expect(wifi.ssid, 'MyNetwork');
        expect(wifi.password, 'MyPass123');
        expect(wifi.encryptionType, 'WPA');
      });

      test('parses WiFi with no password', () {
        final result = ContentParser.parse('WIFI:T:nopass;S:OpenNet;P:;;');
        expect(result, isA<WifiPayload>());
        final wifi = result as WifiPayload;
        expect(wifi.ssid, 'OpenNet');
        expect(wifi.encryptionType, 'NOPASS');
      });

      test('parses WiFi with escaped semicolon in SSID', () {
        final result =
            ContentParser.parse(r'WIFI:T:WPA;S:My\;Network;P:pass;;');
        expect(result, isA<WifiPayload>());
        expect((result as WifiPayload).ssid, 'My;Network');
      });

      test('parses WiFi with hidden flag', () {
        final result =
            ContentParser.parse('WIFI:T:WPA;S:Hidden;P:pass;H:true;;');
        expect(result, isA<WifiPayload>());
        expect((result as WifiPayload).hidden, true);
      });
    });

    // -----------------------------------------------------------------------
    // Contact / VCard
    // -----------------------------------------------------------------------
    group('Contact parsing', () {
      test('parses VCard with FN', () {
        const vcard ='BEGIN:VCARD\n'
            'VERSION:3.0\n'
            'FN:John Doe\n'
            'TEL:+1234567890\n'
            'EMAIL:john@example.com\n'
            'ORG:Acme Corp\n'
            'END:VCARD';
        final result = ContentParser.parse(vcard);
        expect(result, isA<ContactPayload>());
        final contact = result as ContactPayload;
        expect(contact.fullName, 'John Doe');
        expect(contact.phone, '+1234567890');
        expect(contact.email, 'john@example.com');
        expect(contact.organization, 'Acme Corp');
      });

      test('parses VCard with N field (no FN)', () {
        const vcard ='BEGIN:VCARD\n'
            'VERSION:3.0\n'
            'N:Doe;John;;;\n'
            'TEL:+1234567890\n'
            'END:VCARD';
        final result = ContentParser.parse(vcard);
        expect(result, isA<ContactPayload>());
        expect((result as ContactPayload).fullName, 'John Doe');
      });

      test('parses VCard with TEL;TYPE=CELL', () {
        const vcard ='BEGIN:VCARD\n'
            'VERSION:3.0\n'
            'FN:Jane\n'
            'TEL;TYPE=CELL:+9876543210\n'
            'END:VCARD';
        final result = ContentParser.parse(vcard);
        expect(result, isA<ContactPayload>());
        expect((result as ContactPayload).phone, '+9876543210');
      });

      test('parses MECARD format', () {
        final result = ContentParser.parse(
          'MECARD:N:Doe,John;TEL:+1234567890;EMAIL:john@test.com;;',
        );
        expect(result, isA<ContactPayload>());
        final contact = result as ContactPayload;
        expect(contact.fullName, 'John Doe');
        expect(contact.phone, '+1234567890');
        expect(contact.email, 'john@test.com');
      });
    });

    // -----------------------------------------------------------------------
    // Email
    // -----------------------------------------------------------------------
    group('Email parsing', () {
      test('parses mailto: URL', () {
        final result = ContentParser.parse('mailto:test@example.com');
        expect(result, isA<EmailPayload>());
        expect((result as EmailPayload).address, 'test@example.com');
      });

      test('parses mailto: with subject', () {
        final result = ContentParser.parse(
          'mailto:test@example.com?subject=Hello&body=World',
        );
        expect(result, isA<EmailPayload>());
        final email = result as EmailPayload;
        expect(email.subject, 'Hello');
        expect(email.body, 'World');
      });

      test('parses MATMSG format', () {
        final result = ContentParser.parse(
          'MATMSG:TO:test@example.com;SUB:Hi;BODY:Hello;;',
        );
        expect(result, isA<EmailPayload>());
        final email = result as EmailPayload;
        expect(email.address, 'test@example.com');
        expect(email.subject, 'Hi');
      });
    });

    // -----------------------------------------------------------------------
    // Phone
    // -----------------------------------------------------------------------
    group('Phone parsing', () {
      test('parses tel: scheme', () {
        final result = ContentParser.parse('tel:+1234567890');
        expect(result, isA<PhonePayload>());
        expect((result as PhonePayload).number, '+1234567890');
      });

      test('parses international format', () {
        final result = ContentParser.parse('+44 20 7946 0958');
        expect(result, isA<PhonePayload>());
      });

      test('does NOT parse pure digits as phone (goes to product)', () {
        final result = ContentParser.parse('5901234123457');
        // 13-digit number → product, not phone
        expect(result, isA<ProductPayload>());
      });
    });

    // -----------------------------------------------------------------------
    // SMS
    // -----------------------------------------------------------------------
    group('SMS parsing', () {
      test('parses smsto: with message', () {
        final result = ContentParser.parse('smsto:+1234567890:Hello');
        expect(result, isA<SmsPayload>());
        final sms = result as SmsPayload;
        expect(sms.number, '+1234567890');
        expect(sms.message, 'Hello');
      });

      test('parses sms: without message', () {
        final result = ContentParser.parse('sms:+1234567890');
        expect(result, isA<SmsPayload>());
      });
    });

    // -----------------------------------------------------------------------
    // Geo
    // -----------------------------------------------------------------------
    group('Geo parsing', () {
      test('parses geo: URI', () {
        final result = ContentParser.parse('geo:10.762622,106.660172');
        expect(result, isA<GeoPayload>());
        final geo = result as GeoPayload;
        expect(geo.latitude, closeTo(10.762622, 0.0001));
        expect(geo.longitude, closeTo(106.660172, 0.0001));
      });

      test('parses geo: with label', () {
        final result =
            ContentParser.parse('geo:48.8566,2.3522?q=Paris');
        expect(result, isA<GeoPayload>());
        expect((result as GeoPayload).label, 'Paris');
      });
    });

    // -----------------------------------------------------------------------
    // Calendar
    // -----------------------------------------------------------------------
    group('Calendar parsing', () {
      test('parses VEVENT', () {
        const vevent ='BEGIN:VEVENT\n'
            'SUMMARY:Team Meeting\n'
            'DTSTART:20261015T140000\n'
            'DTEND:20261015T150000\n'
            'LOCATION:Room 42\n'
            'END:VEVENT';
        final result = ContentParser.parse(vevent);
        expect(result, isA<CalendarPayload>());
        final cal = result as CalendarPayload;
        expect(cal.summary, 'Team Meeting');
        expect(cal.location, 'Room 42');
        expect(cal.dtStart?.year, 2026);
        expect(cal.dtStart?.hour, 14);
      });

      test('parses date-only DTSTART', () {
        const vevent ='BEGIN:VEVENT\n'
            'SUMMARY:All Day\n'
            'DTSTART;VALUE=DATE:20261025\n'
            'END:VEVENT';
        final result = ContentParser.parse(vevent);
        expect(result, isA<CalendarPayload>());
        final cal = result as CalendarPayload;
        expect(cal.dtStart?.day, 25);
      });
    });

    // -----------------------------------------------------------------------
    // Product
    // -----------------------------------------------------------------------
    group('Product parsing', () {
      test('parses EAN-13', () {
        final result = ContentParser.parse('5901234123457');
        expect(result, isA<ProductPayload>());
        expect((result as ProductPayload).code, '5901234123457');
      });

      test('parses EAN-8', () {
        final result = ContentParser.parse('96385074');
        expect(result, isA<ProductPayload>());
      });

      test('parses UPC-A', () {
        final result = ContentParser.parse('012345678905');
        expect(result, isA<ProductPayload>());
      });
    });

    // -----------------------------------------------------------------------
    // Text fallback
    // -----------------------------------------------------------------------
    group('Text fallback', () {
      test('falls back to text for unknown content', () {
        final result = ContentParser.parse('just some random text');
        expect(result, isA<TextPayload>());
        expect(result.contentType, CodeContent.text);
      });
    });
  });
}
