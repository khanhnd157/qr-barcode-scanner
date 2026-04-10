import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';

enum BarcodeFormatType {
  ean13('EAN-13', Icons.barcode_reader, 'ean13'),
  ean8('EAN-8', Icons.barcode_reader, 'ean8'),
  upcA('UPC-A', Icons.barcode_reader, 'upcA'),
  code39('Code 39', Icons.barcode_reader, 'code39'),
  code128('Code 128', Icons.barcode_reader, 'code128'),
  itf('ITF', Icons.barcode_reader, 'itf'),
  codabar('Codabar', Icons.barcode_reader, 'codabar');

  const BarcodeFormatType(this.label, this.icon, this.routeName);

  final String label;
  final IconData icon;
  final String routeName;

  static BarcodeFormatType fromName(String name) {
    return BarcodeFormatType.values.firstWhere(
      (e) => e.routeName == name,
      orElse: () => BarcodeFormatType.code128,
    );
  }

  Barcode toBarcodeLib() {
    return switch (this) {
      BarcodeFormatType.ean13 => Barcode.ean13(),
      BarcodeFormatType.ean8 => Barcode.ean8(),
      BarcodeFormatType.upcA => Barcode.upcA(),
      BarcodeFormatType.code39 => Barcode.code39(),
      BarcodeFormatType.code128 => Barcode.code128(),
      BarcodeFormatType.itf => Barcode.itf(),
      BarcodeFormatType.codabar => Barcode.codabar(),
    };
  }
}
