enum CodeFormat {
  qr('QR Code'),
  ean13('EAN-13'),
  ean8('EAN-8'),
  upcA('UPC-A'),
  upcE('UPC-E'),
  code39('Code 39'),
  code93('Code 93'),
  code128('Code 128'),
  itf('ITF'),
  codabar('Codabar'),
  pdf417('PDF417'),
  dataMatrix('Data Matrix'),
  aztec('Aztec'),
  unknown('Unknown');

  const CodeFormat(this.label);

  final String label;
}
