// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'QR & Barcode Scanner';

  @override
  String get scan => 'Scan';

  @override
  String get generate => 'Generate';

  @override
  String get history => 'History';

  @override
  String get favorites => 'Favorites';

  @override
  String get settings => 'Settings';

  @override
  String get result => 'Result';

  @override
  String get qrCode => 'QR Code';

  @override
  String get barcode => 'Barcode';

  @override
  String get scanned => 'Scanned';

  @override
  String get created => 'Created';

  @override
  String get text => 'Text';

  @override
  String get url => 'URL';

  @override
  String get phone => 'Phone';

  @override
  String get email => 'Email';

  @override
  String get wifi => 'Wi-Fi';

  @override
  String get contact => 'Contact/VCard';

  @override
  String get sms => 'SMS';

  @override
  String get geolocation => 'Geolocation';

  @override
  String get calendar => 'Calendar';

  @override
  String get clipboard => 'Clipboard';

  @override
  String get application => 'Application';

  @override
  String get copy => 'Copy';

  @override
  String get share => 'Share';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get done => 'Done';

  @override
  String get clear => 'Clear';

  @override
  String get clearAll => 'Clear All';

  @override
  String get clearScanned => 'Clear Scanned';

  @override
  String get clearCreated => 'Clear Created';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get actions => 'Actions';

  @override
  String get rawData => 'Raw Data';

  @override
  String get openInBrowser => 'Open in Browser';

  @override
  String get copyUrl => 'Copy URL';

  @override
  String get copyPassword => 'Copy Password';

  @override
  String get copyNumber => 'Copy Number';

  @override
  String get call => 'Call';

  @override
  String get sendEmail => 'Send Email';

  @override
  String get sendSms => 'Send SMS';

  @override
  String get addContact => 'Add Contact';

  @override
  String get openInMaps => 'Open in Maps';

  @override
  String get addToCalendar => 'Add to Calendar';

  @override
  String get searchWeb => 'Search Web';

  @override
  String get wifiSettings => 'Wi-Fi Settings';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get urlCopied => 'URL copied';

  @override
  String get passwordCopied => 'Password copied';

  @override
  String get numberCopied => 'Number copied';

  @override
  String get contactDataCopied => 'Contact data copied to clipboard';

  @override
  String get passwordCopiedConnectWifi =>
      'Password copied — connect in Wi-Fi settings';

  @override
  String get openingWifiSettings => 'Opening Wi-Fi settings';

  @override
  String get savedToGallery => 'Saved to gallery';

  @override
  String get noCodeFoundInImage => 'No QR code or barcode found in image';

  @override
  String get bulkScanMode => 'Bulk Scan Mode';

  @override
  String get bulkScanPointAtCodes => 'Bulk Scan — point at codes';

  @override
  String nScanned(int count) {
    return '$count scanned';
  }

  @override
  String get bulk => 'BULK';

  @override
  String get flashOn => 'Flash On';

  @override
  String get flashOff => 'Flash Off';

  @override
  String get gallery => 'Gallery';

  @override
  String get scanFromGallery => 'Scan from gallery';

  @override
  String get noHistoryYet => 'No history yet';

  @override
  String get noScannedResults => 'No scanned results';

  @override
  String get noCreatedResults => 'No created results';

  @override
  String get scanToSeeHere => 'Scan a QR code or barcode to see it here';

  @override
  String get generateToSeeHere =>
      'Generate a QR code or barcode to see it here';

  @override
  String get noFavoritesYet => 'No favorites yet';

  @override
  String get starItemsToSaveHere =>
      'Star items from scan results or history to save them here';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get deleteAllHistoryItems => 'Delete all history items?';

  @override
  String get deleteAllScannedResults => 'Delete all scanned results?';

  @override
  String get deleteAllCreatedResults => 'Delete all created results?';

  @override
  String get deleteItem => 'Are you sure you want to delete this item?';

  @override
  String get searchHistory => 'Search history...';

  @override
  String get appearance => 'APPEARANCE';

  @override
  String get theme => 'Theme';

  @override
  String get chooseTheme => 'Choose Theme';

  @override
  String get systemTheme => 'System';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get scanSettings => 'SCAN';

  @override
  String get vibrate => 'Vibrate';

  @override
  String get vibrateDesc => 'Vibrate on successful scan';

  @override
  String get beepSound => 'Beep Sound';

  @override
  String get beepDesc => 'Play sound on successful scan';

  @override
  String get bulkScanModeTitle => 'Bulk Scan Mode';

  @override
  String get bulkScanModeDesc => 'Scan multiple codes continuously';

  @override
  String get openUrlAutomatically => 'Open URL Automatically';

  @override
  String get openUrlDesc => 'Open links in browser after scan';

  @override
  String get dataSettings => 'DATA';

  @override
  String get saveHistory => 'Save Scan History';

  @override
  String get saveHistoryDesc => 'Automatically save scanned results';

  @override
  String get storeImages => 'Store Images';

  @override
  String get storeImagesDesc => 'Save generated QR/barcode images';

  @override
  String get copyToClipboard => 'Copy to Clipboard';

  @override
  String get copyToClipboardDesc => 'Auto-copy scan result to clipboard';

  @override
  String get about => 'About';

  @override
  String get aboutTitle => 'ABOUT';

  @override
  String get rateUs => 'Rate Us';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get version => 'Version';

  @override
  String get cameraPermissionRequired => 'Camera Permission Required';

  @override
  String get cameraPermissionMessage =>
      'This app needs camera access to scan QR codes and barcodes. Please grant camera permission in your device settings.';

  @override
  String get cameraError => 'Camera Error';

  @override
  String get cameraErrorMessage =>
      'Unable to start the camera. Please try closing and reopening the app.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get enterText => 'Enter text';

  @override
  String get enterPackageName => 'Enter package name or App Store ID';

  @override
  String get enterTextFromClipboard => 'Enter text from clipboard';

  @override
  String get networkName => 'Network Name (SSID)';

  @override
  String get password => 'Password';

  @override
  String get security => 'Security';

  @override
  String get hiddenNetwork => 'Hidden Network';

  @override
  String get fullName => 'Full Name';

  @override
  String get company => 'Company';

  @override
  String get address => 'Address';

  @override
  String get website => 'Website';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get subject => 'Subject';

  @override
  String get body => 'Body';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get message => 'Message';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get label => 'Label';

  @override
  String get eventTitle => 'Event Title';

  @override
  String get start => 'Start';

  @override
  String get end => 'End';

  @override
  String get location => 'Location';

  @override
  String get description => 'Description';

  @override
  String get notSet => 'Not set';

  @override
  String get barcodeData => 'Barcode Data';

  @override
  String createQr(String type) {
    return 'Create $type QR';
  }

  @override
  String createBarcode(String format) {
    return 'Create $format';
  }

  @override
  String get privacyPolicyContent =>
      'Privacy Policy\n\nThis application processes all data locally on your device. No personal data, scan results, or generated codes are sent to any external server.\n\nCamera Access\nThe camera is used solely for scanning QR codes and barcodes. Images are not stored unless you explicitly enable the \"Store Images\" setting.\n\nData Storage\nAll scan history and generated codes are stored locally on your device. You can delete this data at any time from the History screen or Settings.\n\nThird-Party Services\nThis app does not use analytics, advertising, or tracking services.\n\nContact\nFor questions about this privacy policy, please contact us at privacy@izmaze.com.';
}
