/// Validates barcode input for each format type.
class BarcodeGeneratorService {
  static String? validateEan13(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 12 && digits.length != 13) {
      return 'EAN-13 requires 12 or 13 digits';
    }
    return null;
  }

  static String? validateEan8(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 7 && digits.length != 8) {
      return 'EAN-8 requires 7 or 8 digits';
    }
    return null;
  }

  static String? validateUpcA(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 11 && digits.length != 12) {
      return 'UPC-A requires 11 or 12 digits';
    }
    return null;
  }

  static String? validateCode39(String value) {
    if (!RegExp(r'^[A-Z0-9 \-.$\/+%]+$').hasMatch(value)) {
      return 'Code 39 allows uppercase A-Z, 0-9, and - . \$ / + %';
    }
    return null;
  }

  static String? validateCode128(String value) {
    if (value.isEmpty) return 'Value cannot be empty';
    return null;
  }

  static String? validateItf(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 2 || digits.length.isOdd) {
      return 'ITF requires an even number of digits (minimum 2)';
    }
    return null;
  }

  static String? validateCodabar(String value) {
    if (!RegExp(r'^[A-Da-d][0-9\-$:/.+]+[A-Da-d]$').hasMatch(value)) {
      return 'Codabar must start and end with A/B/C/D, '
          'containing digits and - \$ : / . +';
    }
    return null;
  }

  /// Returns validator function for the given barcode format name.
  static String? Function(String) getValidator(String formatName) {
    return switch (formatName) {
      'ean13' => validateEan13,
      'ean8' => validateEan8,
      'upcA' => validateUpcA,
      'code39' => validateCode39,
      'code128' => validateCode128,
      'itf' => validateItf,
      'codabar' => validateCodabar,
      _ => (_) => null,
    };
  }
}
