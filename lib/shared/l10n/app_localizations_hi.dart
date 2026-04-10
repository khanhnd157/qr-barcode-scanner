// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'QR और बारकोड स्कैनर';

  @override
  String get scan => 'स्कैन';

  @override
  String get generate => 'बनाएँ';

  @override
  String get history => 'इतिहास';

  @override
  String get favorites => 'पसंदीदा';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get result => 'परिणाम';

  @override
  String get qrCode => 'QR कोड';

  @override
  String get barcode => 'बारकोड';

  @override
  String get scanned => 'स्कैन किए गए';

  @override
  String get created => 'बनाए गए';

  @override
  String get text => 'टेक्स्ट';

  @override
  String get url => 'URL';

  @override
  String get phone => 'फ़ोन';

  @override
  String get email => 'ईमेल';

  @override
  String get wifi => 'वाई-फ़ाई';

  @override
  String get contact => 'संपर्क/VCard';

  @override
  String get sms => 'SMS';

  @override
  String get geolocation => 'भू-स्थान';

  @override
  String get calendar => 'कैलेंडर';

  @override
  String get clipboard => 'क्लिपबोर्ड';

  @override
  String get application => 'एप्लिकेशन';

  @override
  String get copy => 'कॉपी करें';

  @override
  String get share => 'शेयर करें';

  @override
  String get save => 'सेव करें';

  @override
  String get delete => 'हटाएँ';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get confirm => 'पुष्टि करें';

  @override
  String get done => 'हो गया';

  @override
  String get clear => 'साफ़ करें';

  @override
  String get clearAll => 'सभी साफ़ करें';

  @override
  String get clearScanned => 'स्कैन किए गए साफ़ करें';

  @override
  String get clearCreated => 'बनाए गए साफ़ करें';

  @override
  String get tryAgain => 'फिर से प्रयास करें';

  @override
  String get actions => 'कार्रवाइयाँ';

  @override
  String get rawData => 'कच्चा डेटा';

  @override
  String get openInBrowser => 'ब्राउज़र में खोलें';

  @override
  String get copyUrl => 'URL कॉपी करें';

  @override
  String get copyPassword => 'पासवर्ड कॉपी करें';

  @override
  String get copyNumber => 'नंबर कॉपी करें';

  @override
  String get call => 'कॉल करें';

  @override
  String get sendEmail => 'ईमेल भेजें';

  @override
  String get sendSms => 'SMS भेजें';

  @override
  String get addContact => 'संपर्क जोड़ें';

  @override
  String get openInMaps => 'मैप में खोलें';

  @override
  String get addToCalendar => 'कैलेंडर में जोड़ें';

  @override
  String get searchWeb => 'वेब पर खोजें';

  @override
  String get wifiSettings => 'वाई-फ़ाई सेटिंग्स';

  @override
  String get copiedToClipboard => 'क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get urlCopied => 'URL कॉपी किया गया';

  @override
  String get passwordCopied => 'पासवर्ड कॉपी किया गया';

  @override
  String get numberCopied => 'नंबर कॉपी किया गया';

  @override
  String get contactDataCopied => 'संपर्क डेटा क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get passwordCopiedConnectWifi =>
      'पासवर्ड कॉपी किया गया — वाई-फ़ाई सेटिंग्स में कनेक्ट करें';

  @override
  String get openingWifiSettings => 'वाई-फ़ाई सेटिंग्स खोली जा रही हैं';

  @override
  String get savedToGallery => 'गैलरी में सेव किया गया';

  @override
  String get noCodeFoundInImage => 'इमेज में कोई QR कोड या बारकोड नहीं मिला';

  @override
  String get bulkScanMode => 'बल्क स्कैन मोड';

  @override
  String get bulkScanPointAtCodes => 'बल्क स्कैन — कोड की ओर इंगित करें';

  @override
  String nScanned(int count) {
    return '$count स्कैन किए गए';
  }

  @override
  String get bulk => 'बल्क';

  @override
  String get flashOn => 'फ़्लैश चालू';

  @override
  String get flashOff => 'फ़्लैश बंद';

  @override
  String get gallery => 'गैलरी';

  @override
  String get scanFromGallery => 'गैलरी से स्कैन करें';

  @override
  String get noHistoryYet => 'अभी तक कोई इतिहास नहीं';

  @override
  String get noScannedResults => 'कोई स्कैन किए गए परिणाम नहीं';

  @override
  String get noCreatedResults => 'कोई बनाए गए परिणाम नहीं';

  @override
  String get scanToSeeHere => 'यहाँ देखने के लिए QR कोड या बारकोड स्कैन करें';

  @override
  String get generateToSeeHere => 'यहाँ देखने के लिए QR कोड या बारकोड बनाएँ';

  @override
  String get noFavoritesYet => 'अभी तक कोई पसंदीदा नहीं';

  @override
  String get starItemsToSaveHere =>
      'यहाँ सेव करने के लिए स्कैन परिणामों या इतिहास से आइटम को स्टार करें';

  @override
  String get clearHistory => 'इतिहास साफ़ करें';

  @override
  String get deleteAllHistoryItems => 'सभी इतिहास आइटम हटाएँ?';

  @override
  String get deleteAllScannedResults => 'सभी स्कैन किए गए परिणाम हटाएँ?';

  @override
  String get deleteAllCreatedResults => 'सभी बनाए गए परिणाम हटाएँ?';

  @override
  String get deleteItem => 'क्या आप वाकई इस आइटम को हटाना चाहते हैं?';

  @override
  String get searchHistory => 'इतिहास खोजें...';

  @override
  String get appearance => 'दिखावट';

  @override
  String get theme => 'थीम';

  @override
  String get chooseTheme => 'थीम चुनें';

  @override
  String get systemTheme => 'सिस्टम';

  @override
  String get lightTheme => 'लाइट';

  @override
  String get darkTheme => 'डार्क';

  @override
  String get scanSettings => 'स्कैन';

  @override
  String get vibrate => 'कंपन';

  @override
  String get vibrateDesc => 'सफल स्कैन पर कंपन करें';

  @override
  String get beepSound => 'बीप ध्वनि';

  @override
  String get beepDesc => 'सफल स्कैन पर ध्वनि बजाएँ';

  @override
  String get bulkScanModeTitle => 'बल्क स्कैन मोड';

  @override
  String get bulkScanModeDesc => 'लगातार कई कोड स्कैन करें';

  @override
  String get openUrlAutomatically => 'URL स्वतः खोलें';

  @override
  String get openUrlDesc => 'स्कैन के बाद ब्राउज़र में लिंक खोलें';

  @override
  String get dataSettings => 'डेटा';

  @override
  String get saveHistory => 'स्कैन इतिहास सेव करें';

  @override
  String get saveHistoryDesc => 'स्कैन किए गए परिणाम स्वतः सेव करें';

  @override
  String get storeImages => 'इमेज स्टोर करें';

  @override
  String get storeImagesDesc => 'बनाई गई QR/बारकोड इमेज सेव करें';

  @override
  String get copyToClipboard => 'क्लिपबोर्ड पर कॉपी करें';

  @override
  String get copyToClipboardDesc =>
      'स्कैन परिणाम स्वतः क्लिपबोर्ड पर कॉपी करें';

  @override
  String get about => 'परिचय';

  @override
  String get aboutTitle => 'परिचय';

  @override
  String get rateUs => 'हमें रेट करें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get version => 'संस्करण';

  @override
  String get cameraPermissionRequired => 'कैमरा अनुमति आवश्यक';

  @override
  String get cameraPermissionMessage =>
      'QR कोड और बारकोड स्कैन करने के लिए इस ऐप को कैमरा एक्सेस की आवश्यकता है। कृपया अपनी डिवाइस सेटिंग्स में कैमरा अनुमति दें।';

  @override
  String get cameraError => 'कैमरा त्रुटि';

  @override
  String get cameraErrorMessage =>
      'कैमरा शुरू करने में असमर्थ। कृपया ऐप को बंद करके फिर से खोलें।';

  @override
  String get openSettings => 'सेटिंग्स खोलें';

  @override
  String get enterText => 'टेक्स्ट दर्ज करें';

  @override
  String get enterPackageName => 'पैकेज का नाम या App Store ID दर्ज करें';

  @override
  String get enterTextFromClipboard => 'क्लिपबोर्ड से टेक्स्ट दर्ज करें';

  @override
  String get networkName => 'नेटवर्क का नाम (SSID)';

  @override
  String get password => 'पासवर्ड';

  @override
  String get security => 'सुरक्षा';

  @override
  String get hiddenNetwork => 'छिपा हुआ नेटवर्क';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get company => 'कंपनी';

  @override
  String get address => 'पता';

  @override
  String get website => 'वेबसाइट';

  @override
  String get emailAddress => 'ईमेल पता';

  @override
  String get subject => 'विषय';

  @override
  String get body => 'मुख्य भाग';

  @override
  String get phoneNumber => 'फ़ोन नंबर';

  @override
  String get message => 'संदेश';

  @override
  String get latitude => 'अक्षांश';

  @override
  String get longitude => 'देशांतर';

  @override
  String get label => 'लेबल';

  @override
  String get eventTitle => 'इवेंट का शीर्षक';

  @override
  String get start => 'शुरू';

  @override
  String get end => 'समाप्त';

  @override
  String get location => 'स्थान';

  @override
  String get description => 'विवरण';

  @override
  String get notSet => 'सेट नहीं है';

  @override
  String get barcodeData => 'बारकोड डेटा';

  @override
  String createQr(String type) {
    return '$type QR बनाएँ';
  }

  @override
  String createBarcode(String format) {
    return '$format बनाएँ';
  }

  @override
  String get privacyPolicyContent =>
      'गोपनीयता नीति\n\nयह एप्लिकेशन सभी डेटा को आपके डिवाइस पर स्थानीय रूप से प्रोसेस करता है। कोई भी व्यक्तिगत डेटा, स्कैन परिणाम या बनाए गए कोड किसी बाहरी सर्वर पर नहीं भेजे जाते।\n\nकैमरा एक्सेस\nकैमरा का उपयोग केवल QR कोड और बारकोड स्कैन करने के लिए किया जाता है। जब तक आप \"इमेज स्टोर करें\" सेटिंग स्पष्ट रूप से सक्षम नहीं करते, तब तक इमेज स्टोर नहीं की जातीं।\n\nडेटा संग्रहण\nसभी स्कैन इतिहास और बनाए गए कोड आपके डिवाइस पर स्थानीय रूप से संग्रहीत हैं। आप इस डेटा को इतिहास स्क्रीन या सेटिंग्स से कभी भी हटा सकते हैं।\n\nतृतीय-पक्ष सेवाएँ\nयह ऐप किसी भी एनालिटिक्स, विज्ञापन या ट्रैकिंग सेवा का उपयोग नहीं करता।\n\nसंपर्क\nइस गोपनीयता नीति के बारे में प्रश्नों के लिए, कृपया हमसे privacy@izmaze.com पर संपर्क करें।';
}
