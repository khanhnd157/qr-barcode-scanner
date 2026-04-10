import 'package:flutter_test/flutter_test.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/barcode_generator_service.dart';

void main() {
  group('BarcodeGeneratorService validation', () {
    // EAN-13
    group('EAN-13', () {
      test('accepts 12 digits', () {
        expect(BarcodeGeneratorService.validateEan13('590123412345'), isNull);
      });
      test('accepts 13 digits', () {
        expect(BarcodeGeneratorService.validateEan13('5901234123457'), isNull);
      });
      test('rejects 10 digits', () {
        expect(BarcodeGeneratorService.validateEan13('5901234123'), isNotNull);
      });
      test('rejects letters', () {
        expect(BarcodeGeneratorService.validateEan13('59012341234A'), isNotNull);
      });
    });

    // EAN-8
    group('EAN-8', () {
      test('accepts 7 digits', () {
        expect(BarcodeGeneratorService.validateEan8('9638507'), isNull);
      });
      test('accepts 8 digits', () {
        expect(BarcodeGeneratorService.validateEan8('96385074'), isNull);
      });
      test('rejects 6 digits', () {
        expect(BarcodeGeneratorService.validateEan8('963850'), isNotNull);
      });
    });

    // UPC-A
    group('UPC-A', () {
      test('accepts 11 digits', () {
        expect(BarcodeGeneratorService.validateUpcA('01234567890'), isNull);
      });
      test('accepts 12 digits', () {
        expect(BarcodeGeneratorService.validateUpcA('012345678905'), isNull);
      });
      test('rejects 10 digits', () {
        expect(BarcodeGeneratorService.validateUpcA('0123456789'), isNotNull);
      });
    });

    // Code 39
    group('Code 39', () {
      test('accepts uppercase + digits', () {
        expect(BarcodeGeneratorService.validateCode39('HELLO-123'), isNull);
      });
      test('rejects lowercase', () {
        expect(BarcodeGeneratorService.validateCode39('hello'), isNotNull);
      });
      test('accepts special chars', () {
        expect(BarcodeGeneratorService.validateCode39('A-B.C\$D'), isNull);
      });
    });

    // Code 128
    group('Code 128', () {
      test('accepts any non-empty string', () {
        expect(BarcodeGeneratorService.validateCode128('Hello World!'), isNull);
      });
      test('rejects empty string', () {
        expect(BarcodeGeneratorService.validateCode128(''), isNotNull);
      });
    });

    // ITF
    group('ITF', () {
      test('accepts even number of digits', () {
        expect(BarcodeGeneratorService.validateItf('1234567890'), isNull);
      });
      test('rejects odd number of digits', () {
        expect(BarcodeGeneratorService.validateItf('12345'), isNotNull);
      });
      test('rejects single digit', () {
        expect(BarcodeGeneratorService.validateItf('1'), isNotNull);
      });
    });

    // Codabar
    group('Codabar', () {
      test('accepts valid format', () {
        expect(BarcodeGeneratorService.validateCodabar('A12345B'), isNull);
      });
      test('rejects without start/end chars', () {
        expect(BarcodeGeneratorService.validateCodabar('12345'), isNotNull);
      });
    });

    // getValidator
    group('getValidator', () {
      test('returns correct validator for known format', () {
        final validator = BarcodeGeneratorService.getValidator('ean13');
        expect(validator('5901234123457'), isNull);
        expect(validator('short'), isNotNull);
      });
      test('returns permissive validator for unknown format', () {
        final validator = BarcodeGeneratorService.getValidator('unknown');
        expect(validator('anything'), isNull);
      });
    });
  });
}
