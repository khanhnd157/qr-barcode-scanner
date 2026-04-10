// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'QR- & Barcode-Scanner';

  @override
  String get scan => 'Scannen';

  @override
  String get generate => 'Erstellen';

  @override
  String get history => 'Verlauf';

  @override
  String get favorites => 'Favoriten';

  @override
  String get settings => 'Einstellungen';

  @override
  String get result => 'Ergebnis';

  @override
  String get qrCode => 'QR-Code';

  @override
  String get barcode => 'Barcode';

  @override
  String get scanned => 'Gescannt';

  @override
  String get created => 'Erstellt';

  @override
  String get text => 'Text';

  @override
  String get url => 'URL';

  @override
  String get phone => 'Telefon';

  @override
  String get email => 'E-Mail';

  @override
  String get wifi => 'WLAN';

  @override
  String get contact => 'Kontakt/VCard';

  @override
  String get sms => 'SMS';

  @override
  String get geolocation => 'Standort';

  @override
  String get calendar => 'Kalender';

  @override
  String get clipboard => 'Zwischenablage';

  @override
  String get application => 'Anwendung';

  @override
  String get copy => 'Kopieren';

  @override
  String get share => 'Teilen';

  @override
  String get save => 'Speichern';

  @override
  String get delete => 'Löschen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get done => 'Fertig';

  @override
  String get clear => 'Leeren';

  @override
  String get clearAll => 'Alles leeren';

  @override
  String get clearScanned => 'Gescannte leeren';

  @override
  String get clearCreated => 'Erstellte leeren';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get actions => 'Aktionen';

  @override
  String get rawData => 'Rohdaten';

  @override
  String get openInBrowser => 'Im Browser öffnen';

  @override
  String get copyUrl => 'URL kopieren';

  @override
  String get copyPassword => 'Passwort kopieren';

  @override
  String get copyNumber => 'Nummer kopieren';

  @override
  String get call => 'Anrufen';

  @override
  String get sendEmail => 'E-Mail senden';

  @override
  String get sendSms => 'SMS senden';

  @override
  String get addContact => 'Kontakt hinzufügen';

  @override
  String get openInMaps => 'In Karten öffnen';

  @override
  String get addToCalendar => 'Zum Kalender hinzufügen';

  @override
  String get searchWeb => 'Im Web suchen';

  @override
  String get wifiSettings => 'WLAN-Einstellungen';

  @override
  String get copiedToClipboard => 'In die Zwischenablage kopiert';

  @override
  String get urlCopied => 'URL kopiert';

  @override
  String get passwordCopied => 'Passwort kopiert';

  @override
  String get numberCopied => 'Nummer kopiert';

  @override
  String get contactDataCopied => 'Kontaktdaten in die Zwischenablage kopiert';

  @override
  String get passwordCopiedConnectWifi =>
      'Passwort kopiert — in den WLAN-Einstellungen verbinden';

  @override
  String get openingWifiSettings => 'WLAN-Einstellungen werden geöffnet';

  @override
  String get savedToGallery => 'In der Galerie gespeichert';

  @override
  String get noCodeFoundInImage => 'Kein QR-Code oder Barcode im Bild gefunden';

  @override
  String get bulkScanMode => 'Massenscan-Modus';

  @override
  String get bulkScanPointAtCodes => 'Massenscan — auf Codes richten';

  @override
  String nScanned(int count) {
    return '$count gescannt';
  }

  @override
  String get bulk => 'MASSE';

  @override
  String get flashOn => 'Blitz an';

  @override
  String get flashOff => 'Blitz aus';

  @override
  String get gallery => 'Galerie';

  @override
  String get scanFromGallery => 'Aus Galerie scannen';

  @override
  String get noHistoryYet => 'Noch kein Verlauf';

  @override
  String get noScannedResults => 'Keine gescannten Ergebnisse';

  @override
  String get noCreatedResults => 'Keine erstellten Ergebnisse';

  @override
  String get scanToSeeHere =>
      'Scannen Sie einen QR-Code oder Barcode, um ihn hier zu sehen';

  @override
  String get generateToSeeHere =>
      'Erstellen Sie einen QR-Code oder Barcode, um ihn hier zu sehen';

  @override
  String get noFavoritesYet => 'Noch keine Favoriten';

  @override
  String get starItemsToSaveHere =>
      'Markieren Sie Ergebnisse oder Verlaufseinträge mit einem Stern, um sie hier zu speichern';

  @override
  String get clearHistory => 'Verlauf leeren';

  @override
  String get deleteAllHistoryItems => 'Alle Verlaufseinträge löschen?';

  @override
  String get deleteAllScannedResults => 'Alle gescannten Ergebnisse löschen?';

  @override
  String get deleteAllCreatedResults => 'Alle erstellten Ergebnisse löschen?';

  @override
  String get deleteItem => 'Möchten Sie dieses Element wirklich löschen?';

  @override
  String get searchHistory => 'Verlauf durchsuchen...';

  @override
  String get appearance => 'ERSCHEINUNGSBILD';

  @override
  String get theme => 'Design';

  @override
  String get chooseTheme => 'Design wählen';

  @override
  String get systemTheme => 'System';

  @override
  String get lightTheme => 'Hell';

  @override
  String get darkTheme => 'Dunkel';

  @override
  String get scanSettings => 'SCANNEN';

  @override
  String get vibrate => 'Vibrieren';

  @override
  String get vibrateDesc => 'Bei erfolgreichem Scan vibrieren';

  @override
  String get beepSound => 'Signalton';

  @override
  String get beepDesc => 'Ton bei erfolgreichem Scan abspielen';

  @override
  String get bulkScanModeTitle => 'Massenscan-Modus';

  @override
  String get bulkScanModeDesc => 'Mehrere Codes fortlaufend scannen';

  @override
  String get openUrlAutomatically => 'URL automatisch öffnen';

  @override
  String get openUrlDesc => 'Links nach dem Scannen im Browser öffnen';

  @override
  String get dataSettings => 'DATEN';

  @override
  String get saveHistory => 'Scanverlauf speichern';

  @override
  String get saveHistoryDesc => 'Gescannte Ergebnisse automatisch speichern';

  @override
  String get storeImages => 'Bilder speichern';

  @override
  String get storeImagesDesc => 'Erstellte QR-/Barcode-Bilder speichern';

  @override
  String get copyToClipboard => 'In Zwischenablage kopieren';

  @override
  String get copyToClipboardDesc =>
      'Scanergebnis automatisch in die Zwischenablage kopieren';

  @override
  String get about => 'Über';

  @override
  String get aboutTitle => 'ÜBER';

  @override
  String get rateUs => 'Bewerten Sie uns';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get version => 'Version';

  @override
  String get cameraPermissionRequired => 'Kameraberechtigung erforderlich';

  @override
  String get cameraPermissionMessage =>
      'Diese App benötigt Kamerazugriff zum Scannen von QR-Codes und Barcodes. Bitte erteilen Sie die Kameraberechtigung in Ihren Geräteeinstellungen.';

  @override
  String get cameraError => 'Kamerafehler';

  @override
  String get cameraErrorMessage =>
      'Die Kamera konnte nicht gestartet werden. Bitte schließen Sie die App und öffnen Sie sie erneut.';

  @override
  String get openSettings => 'Einstellungen öffnen';

  @override
  String get enterText => 'Text eingeben';

  @override
  String get enterPackageName => 'Paketnamen oder App-Store-ID eingeben';

  @override
  String get enterTextFromClipboard => 'Text aus Zwischenablage einfügen';

  @override
  String get networkName => 'Netzwerkname (SSID)';

  @override
  String get password => 'Passwort';

  @override
  String get security => 'Sicherheit';

  @override
  String get hiddenNetwork => 'Verstecktes Netzwerk';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get company => 'Unternehmen';

  @override
  String get address => 'Adresse';

  @override
  String get website => 'Webseite';

  @override
  String get emailAddress => 'E-Mail-Adresse';

  @override
  String get subject => 'Betreff';

  @override
  String get body => 'Nachrichtentext';

  @override
  String get phoneNumber => 'Telefonnummer';

  @override
  String get message => 'Nachricht';

  @override
  String get latitude => 'Breitengrad';

  @override
  String get longitude => 'Längengrad';

  @override
  String get label => 'Bezeichnung';

  @override
  String get eventTitle => 'Veranstaltungstitel';

  @override
  String get start => 'Beginn';

  @override
  String get end => 'Ende';

  @override
  String get location => 'Ort';

  @override
  String get description => 'Beschreibung';

  @override
  String get notSet => 'Nicht festgelegt';

  @override
  String get barcodeData => 'Barcode-Daten';

  @override
  String createQr(String type) {
    return '$type-QR erstellen';
  }

  @override
  String createBarcode(String format) {
    return '$format erstellen';
  }

  @override
  String get privacyPolicyContent =>
      'Datenschutzrichtlinie\n\nDiese Anwendung verarbeitet alle Daten lokal auf Ihrem Gerät. Es werden keine persönlichen Daten, Scanergebnisse oder erstellten Codes an externe Server gesendet.\n\nKamerazugriff\nDie Kamera wird ausschließlich zum Scannen von QR-Codes und Barcodes verwendet. Bilder werden nicht gespeichert, es sei denn, Sie aktivieren ausdrücklich die Einstellung \'Bilder speichern\'.\n\nDatenspeicherung\nAller Scanverlauf und alle erstellten Codes werden lokal auf Ihrem Gerät gespeichert. Sie können diese Daten jederzeit im Verlauf oder in den Einstellungen löschen.\n\nDrittanbieterdienste\nDiese App verwendet keine Analyse-, Werbe- oder Tracking-Dienste.\n\nKontakt\nBei Fragen zu dieser Datenschutzrichtlinie kontaktieren Sie uns bitte unter privacy@izmaze.com.';
}
