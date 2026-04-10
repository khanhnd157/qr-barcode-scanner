import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'QR & Barcode Scanner'**
  String get appTitle;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @generate.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get generate;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @result.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// No description provided for @qrCode.
  ///
  /// In en, this message translates to:
  /// **'QR Code'**
  String get qrCode;

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// No description provided for @scanned.
  ///
  /// In en, this message translates to:
  /// **'Scanned'**
  String get scanned;

  /// No description provided for @created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get created;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @url.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get url;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @wifi.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi'**
  String get wifi;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact/VCard'**
  String get contact;

  /// No description provided for @sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get sms;

  /// No description provided for @geolocation.
  ///
  /// In en, this message translates to:
  /// **'Geolocation'**
  String get geolocation;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @clipboard.
  ///
  /// In en, this message translates to:
  /// **'Clipboard'**
  String get clipboard;

  /// No description provided for @application.
  ///
  /// In en, this message translates to:
  /// **'Application'**
  String get application;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @clearScanned.
  ///
  /// In en, this message translates to:
  /// **'Clear Scanned'**
  String get clearScanned;

  /// No description provided for @clearCreated.
  ///
  /// In en, this message translates to:
  /// **'Clear Created'**
  String get clearCreated;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @rawData.
  ///
  /// In en, this message translates to:
  /// **'Raw Data'**
  String get rawData;

  /// No description provided for @openInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open in Browser'**
  String get openInBrowser;

  /// No description provided for @copyUrl.
  ///
  /// In en, this message translates to:
  /// **'Copy URL'**
  String get copyUrl;

  /// No description provided for @copyPassword.
  ///
  /// In en, this message translates to:
  /// **'Copy Password'**
  String get copyPassword;

  /// No description provided for @copyNumber.
  ///
  /// In en, this message translates to:
  /// **'Copy Number'**
  String get copyNumber;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @sendEmail.
  ///
  /// In en, this message translates to:
  /// **'Send Email'**
  String get sendEmail;

  /// No description provided for @sendSms.
  ///
  /// In en, this message translates to:
  /// **'Send SMS'**
  String get sendSms;

  /// No description provided for @addContact.
  ///
  /// In en, this message translates to:
  /// **'Add Contact'**
  String get addContact;

  /// No description provided for @openInMaps.
  ///
  /// In en, this message translates to:
  /// **'Open in Maps'**
  String get openInMaps;

  /// No description provided for @addToCalendar.
  ///
  /// In en, this message translates to:
  /// **'Add to Calendar'**
  String get addToCalendar;

  /// No description provided for @searchWeb.
  ///
  /// In en, this message translates to:
  /// **'Search Web'**
  String get searchWeb;

  /// No description provided for @wifiSettings.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi Settings'**
  String get wifiSettings;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @urlCopied.
  ///
  /// In en, this message translates to:
  /// **'URL copied'**
  String get urlCopied;

  /// No description provided for @passwordCopied.
  ///
  /// In en, this message translates to:
  /// **'Password copied'**
  String get passwordCopied;

  /// No description provided for @numberCopied.
  ///
  /// In en, this message translates to:
  /// **'Number copied'**
  String get numberCopied;

  /// No description provided for @contactDataCopied.
  ///
  /// In en, this message translates to:
  /// **'Contact data copied to clipboard'**
  String get contactDataCopied;

  /// No description provided for @passwordCopiedConnectWifi.
  ///
  /// In en, this message translates to:
  /// **'Password copied — connect in Wi-Fi settings'**
  String get passwordCopiedConnectWifi;

  /// No description provided for @openingWifiSettings.
  ///
  /// In en, this message translates to:
  /// **'Opening Wi-Fi settings'**
  String get openingWifiSettings;

  /// No description provided for @savedToGallery.
  ///
  /// In en, this message translates to:
  /// **'Saved to gallery'**
  String get savedToGallery;

  /// No description provided for @noCodeFoundInImage.
  ///
  /// In en, this message translates to:
  /// **'No QR code or barcode found in image'**
  String get noCodeFoundInImage;

  /// No description provided for @bulkScanMode.
  ///
  /// In en, this message translates to:
  /// **'Bulk Scan Mode'**
  String get bulkScanMode;

  /// No description provided for @bulkScanPointAtCodes.
  ///
  /// In en, this message translates to:
  /// **'Bulk Scan — point at codes'**
  String get bulkScanPointAtCodes;

  /// No description provided for @nScanned.
  ///
  /// In en, this message translates to:
  /// **'{count} scanned'**
  String nScanned(int count);

  /// No description provided for @bulk.
  ///
  /// In en, this message translates to:
  /// **'BULK'**
  String get bulk;

  /// No description provided for @flashOn.
  ///
  /// In en, this message translates to:
  /// **'Flash On'**
  String get flashOn;

  /// No description provided for @flashOff.
  ///
  /// In en, this message translates to:
  /// **'Flash Off'**
  String get flashOff;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @scanFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Scan from gallery'**
  String get scanFromGallery;

  /// No description provided for @noHistoryYet.
  ///
  /// In en, this message translates to:
  /// **'No history yet'**
  String get noHistoryYet;

  /// No description provided for @noScannedResults.
  ///
  /// In en, this message translates to:
  /// **'No scanned results'**
  String get noScannedResults;

  /// No description provided for @noCreatedResults.
  ///
  /// In en, this message translates to:
  /// **'No created results'**
  String get noCreatedResults;

  /// No description provided for @scanToSeeHere.
  ///
  /// In en, this message translates to:
  /// **'Scan a QR code or barcode to see it here'**
  String get scanToSeeHere;

  /// No description provided for @generateToSeeHere.
  ///
  /// In en, this message translates to:
  /// **'Generate a QR code or barcode to see it here'**
  String get generateToSeeHere;

  /// No description provided for @noFavoritesYet.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavoritesYet;

  /// No description provided for @starItemsToSaveHere.
  ///
  /// In en, this message translates to:
  /// **'Star items from scan results or history to save them here'**
  String get starItemsToSaveHere;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistory;

  /// No description provided for @deleteAllHistoryItems.
  ///
  /// In en, this message translates to:
  /// **'Delete all history items?'**
  String get deleteAllHistoryItems;

  /// No description provided for @deleteAllScannedResults.
  ///
  /// In en, this message translates to:
  /// **'Delete all scanned results?'**
  String get deleteAllScannedResults;

  /// No description provided for @deleteAllCreatedResults.
  ///
  /// In en, this message translates to:
  /// **'Delete all created results?'**
  String get deleteAllCreatedResults;

  /// No description provided for @deleteItem.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this item?'**
  String get deleteItem;

  /// No description provided for @searchHistory.
  ///
  /// In en, this message translates to:
  /// **'Search history...'**
  String get searchHistory;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'APPEARANCE'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @chooseTheme.
  ///
  /// In en, this message translates to:
  /// **'Choose Theme'**
  String get chooseTheme;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @scanSettings.
  ///
  /// In en, this message translates to:
  /// **'SCAN'**
  String get scanSettings;

  /// No description provided for @vibrate.
  ///
  /// In en, this message translates to:
  /// **'Vibrate'**
  String get vibrate;

  /// No description provided for @vibrateDesc.
  ///
  /// In en, this message translates to:
  /// **'Vibrate on successful scan'**
  String get vibrateDesc;

  /// No description provided for @beepSound.
  ///
  /// In en, this message translates to:
  /// **'Beep Sound'**
  String get beepSound;

  /// No description provided for @beepDesc.
  ///
  /// In en, this message translates to:
  /// **'Play sound on successful scan'**
  String get beepDesc;

  /// No description provided for @bulkScanModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Bulk Scan Mode'**
  String get bulkScanModeTitle;

  /// No description provided for @bulkScanModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Scan multiple codes continuously'**
  String get bulkScanModeDesc;

  /// No description provided for @openUrlAutomatically.
  ///
  /// In en, this message translates to:
  /// **'Open URL Automatically'**
  String get openUrlAutomatically;

  /// No description provided for @openUrlDesc.
  ///
  /// In en, this message translates to:
  /// **'Open links in browser after scan'**
  String get openUrlDesc;

  /// No description provided for @dataSettings.
  ///
  /// In en, this message translates to:
  /// **'DATA'**
  String get dataSettings;

  /// No description provided for @saveHistory.
  ///
  /// In en, this message translates to:
  /// **'Save Scan History'**
  String get saveHistory;

  /// No description provided for @saveHistoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Automatically save scanned results'**
  String get saveHistoryDesc;

  /// No description provided for @storeImages.
  ///
  /// In en, this message translates to:
  /// **'Store Images'**
  String get storeImages;

  /// No description provided for @storeImagesDesc.
  ///
  /// In en, this message translates to:
  /// **'Save generated QR/barcode images'**
  String get storeImagesDesc;

  /// No description provided for @copyToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy to Clipboard'**
  String get copyToClipboard;

  /// No description provided for @copyToClipboardDesc.
  ///
  /// In en, this message translates to:
  /// **'Auto-copy scan result to clipboard'**
  String get copyToClipboardDesc;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'ABOUT'**
  String get aboutTitle;

  /// No description provided for @rateUs.
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get rateUs;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @cameraPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Camera Permission Required'**
  String get cameraPermissionRequired;

  /// No description provided for @cameraPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'This app needs camera access to scan QR codes and barcodes. Please grant camera permission in your device settings.'**
  String get cameraPermissionMessage;

  /// No description provided for @cameraError.
  ///
  /// In en, this message translates to:
  /// **'Camera Error'**
  String get cameraError;

  /// No description provided for @cameraErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Unable to start the camera. Please try closing and reopening the app.'**
  String get cameraErrorMessage;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @enterText.
  ///
  /// In en, this message translates to:
  /// **'Enter text'**
  String get enterText;

  /// No description provided for @enterPackageName.
  ///
  /// In en, this message translates to:
  /// **'Enter package name or App Store ID'**
  String get enterPackageName;

  /// No description provided for @enterTextFromClipboard.
  ///
  /// In en, this message translates to:
  /// **'Enter text from clipboard'**
  String get enterTextFromClipboard;

  /// No description provided for @networkName.
  ///
  /// In en, this message translates to:
  /// **'Network Name (SSID)'**
  String get networkName;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @hiddenNetwork.
  ///
  /// In en, this message translates to:
  /// **'Hidden Network'**
  String get hiddenNetwork;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @body.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get body;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @latitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get latitude;

  /// No description provided for @longitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get longitude;

  /// No description provided for @label.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get label;

  /// No description provided for @eventTitle.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get eventTitle;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @notSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get notSet;

  /// No description provided for @barcodeData.
  ///
  /// In en, this message translates to:
  /// **'Barcode Data'**
  String get barcodeData;

  /// No description provided for @createQr.
  ///
  /// In en, this message translates to:
  /// **'Create {type} QR'**
  String createQr(String type);

  /// No description provided for @createBarcode.
  ///
  /// In en, this message translates to:
  /// **'Create {format}'**
  String createBarcode(String format);

  /// No description provided for @privacyPolicyContent.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy\n\nThis application processes all data locally on your device. No personal data, scan results, or generated codes are sent to any external server.\n\nCamera Access\nThe camera is used solely for scanning QR codes and barcodes. Images are not stored unless you explicitly enable the \"Store Images\" setting.\n\nData Storage\nAll scan history and generated codes are stored locally on your device. You can delete this data at any time from the History screen or Settings.\n\nThird-Party Services\nThis app does not use analytics, advertising, or tracking services.\n\nContact\nFor questions about this privacy policy, please contact us at privacy@izmaze.com.'**
  String get privacyPolicyContent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
