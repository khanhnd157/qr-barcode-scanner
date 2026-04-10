// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ماسح QR والباركود';

  @override
  String get scan => 'مسح';

  @override
  String get generate => 'إنشاء';

  @override
  String get history => 'السجل';

  @override
  String get favorites => 'المفضلة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get result => 'النتيجة';

  @override
  String get qrCode => 'رمز QR';

  @override
  String get barcode => 'باركود';

  @override
  String get scanned => 'الممسوحة';

  @override
  String get created => 'المُنشأة';

  @override
  String get text => 'نص';

  @override
  String get url => 'رابط';

  @override
  String get phone => 'هاتف';

  @override
  String get email => 'بريد إلكتروني';

  @override
  String get wifi => 'واي فاي';

  @override
  String get contact => 'جهة اتصال/VCard';

  @override
  String get sms => 'رسالة نصية';

  @override
  String get geolocation => 'الموقع الجغرافي';

  @override
  String get calendar => 'التقويم';

  @override
  String get clipboard => 'الحافظة';

  @override
  String get application => 'تطبيق';

  @override
  String get copy => 'نسخ';

  @override
  String get share => 'مشاركة';

  @override
  String get save => 'حفظ';

  @override
  String get delete => 'حذف';

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirm => 'تأكيد';

  @override
  String get done => 'تم';

  @override
  String get clear => 'مسح';

  @override
  String get clearAll => 'مسح الكل';

  @override
  String get clearScanned => 'مسح الممسوحة';

  @override
  String get clearCreated => 'مسح المُنشأة';

  @override
  String get tryAgain => 'حاول مجدداً';

  @override
  String get actions => 'الإجراءات';

  @override
  String get rawData => 'البيانات الأولية';

  @override
  String get openInBrowser => 'فتح في المتصفح';

  @override
  String get copyUrl => 'نسخ الرابط';

  @override
  String get copyPassword => 'نسخ كلمة المرور';

  @override
  String get copyNumber => 'نسخ الرقم';

  @override
  String get call => 'اتصال';

  @override
  String get sendEmail => 'إرسال بريد إلكتروني';

  @override
  String get sendSms => 'إرسال رسالة نصية';

  @override
  String get addContact => 'إضافة جهة اتصال';

  @override
  String get openInMaps => 'فتح في الخرائط';

  @override
  String get addToCalendar => 'إضافة إلى التقويم';

  @override
  String get searchWeb => 'البحث في الويب';

  @override
  String get wifiSettings => 'إعدادات الواي فاي';

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get urlCopied => 'تم نسخ الرابط';

  @override
  String get passwordCopied => 'تم نسخ كلمة المرور';

  @override
  String get numberCopied => 'تم نسخ الرقم';

  @override
  String get contactDataCopied => 'تم نسخ بيانات جهة الاتصال إلى الحافظة';

  @override
  String get passwordCopiedConnectWifi =>
      'تم نسخ كلمة المرور — اتصل من إعدادات الواي فاي';

  @override
  String get openingWifiSettings => 'جارٍ فتح إعدادات الواي فاي';

  @override
  String get savedToGallery => 'تم الحفظ في المعرض';

  @override
  String get noCodeFoundInImage =>
      'لم يتم العثور على رمز QR أو باركود في الصورة';

  @override
  String get bulkScanMode => 'وضع المسح المتعدد';

  @override
  String get bulkScanPointAtCodes => 'مسح متعدد — وجّه الكاميرا نحو الرموز';

  @override
  String nScanned(int count) {
    return 'تم مسح $count';
  }

  @override
  String get bulk => 'متعدد';

  @override
  String get flashOn => 'تشغيل الفلاش';

  @override
  String get flashOff => 'إيقاف الفلاش';

  @override
  String get gallery => 'المعرض';

  @override
  String get scanFromGallery => 'المسح من المعرض';

  @override
  String get noHistoryYet => 'لا يوجد سجل بعد';

  @override
  String get noScannedResults => 'لا توجد نتائج ممسوحة';

  @override
  String get noCreatedResults => 'لا توجد نتائج مُنشأة';

  @override
  String get scanToSeeHere => 'امسح رمز QR أو باركود لرؤيته هنا';

  @override
  String get generateToSeeHere => 'أنشئ رمز QR أو باركود لرؤيته هنا';

  @override
  String get noFavoritesYet => 'لا توجد مفضلات بعد';

  @override
  String get starItemsToSaveHere =>
      'ضع نجمة على العناصر من نتائج المسح أو السجل لحفظها هنا';

  @override
  String get clearHistory => 'مسح السجل';

  @override
  String get deleteAllHistoryItems => 'حذف جميع عناصر السجل؟';

  @override
  String get deleteAllScannedResults => 'حذف جميع النتائج الممسوحة؟';

  @override
  String get deleteAllCreatedResults => 'حذف جميع النتائج المُنشأة؟';

  @override
  String get deleteItem => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟';

  @override
  String get searchHistory => 'البحث في السجل...';

  @override
  String get appearance => 'المظهر';

  @override
  String get theme => 'السمة';

  @override
  String get chooseTheme => 'اختيار السمة';

  @override
  String get systemTheme => 'النظام';

  @override
  String get lightTheme => 'فاتح';

  @override
  String get darkTheme => 'داكن';

  @override
  String get scanSettings => 'المسح';

  @override
  String get vibrate => 'الاهتزاز';

  @override
  String get vibrateDesc => 'الاهتزاز عند المسح الناجح';

  @override
  String get beepSound => 'صوت التنبيه';

  @override
  String get beepDesc => 'تشغيل صوت عند المسح الناجح';

  @override
  String get bulkScanModeTitle => 'وضع المسح المتعدد';

  @override
  String get bulkScanModeDesc => 'مسح رموز متعددة بشكل متواصل';

  @override
  String get openUrlAutomatically => 'فتح الرابط تلقائياً';

  @override
  String get openUrlDesc => 'فتح الروابط في المتصفح بعد المسح';

  @override
  String get dataSettings => 'البيانات';

  @override
  String get saveHistory => 'حفظ سجل المسح';

  @override
  String get saveHistoryDesc => 'حفظ نتائج المسح تلقائياً';

  @override
  String get storeImages => 'تخزين الصور';

  @override
  String get storeImagesDesc => 'حفظ صور QR/الباركود المُنشأة';

  @override
  String get copyToClipboard => 'النسخ إلى الحافظة';

  @override
  String get copyToClipboardDesc => 'نسخ نتيجة المسح تلقائياً إلى الحافظة';

  @override
  String get about => 'حول';

  @override
  String get aboutTitle => 'حول';

  @override
  String get rateUs => 'قيّمنا';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get version => 'الإصدار';

  @override
  String get cameraPermissionRequired => 'إذن الكاميرا مطلوب';

  @override
  String get cameraPermissionMessage =>
      'يحتاج هذا التطبيق إلى الوصول إلى الكاميرا لمسح رموز QR والباركود. يرجى منح إذن الكاميرا في إعدادات جهازك.';

  @override
  String get cameraError => 'خطأ في الكاميرا';

  @override
  String get cameraErrorMessage =>
      'تعذّر تشغيل الكاميرا. يرجى إغلاق التطبيق وإعادة فتحه.';

  @override
  String get openSettings => 'فتح الإعدادات';

  @override
  String get enterText => 'أدخل النص';

  @override
  String get enterPackageName => 'أدخل اسم الحزمة أو معرّف App Store';

  @override
  String get enterTextFromClipboard => 'أدخل النص من الحافظة';

  @override
  String get networkName => 'اسم الشبكة (SSID)';

  @override
  String get password => 'كلمة المرور';

  @override
  String get security => 'الأمان';

  @override
  String get hiddenNetwork => 'شبكة مخفية';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get company => 'الشركة';

  @override
  String get address => 'العنوان';

  @override
  String get website => 'الموقع الإلكتروني';

  @override
  String get emailAddress => 'عنوان البريد الإلكتروني';

  @override
  String get subject => 'الموضوع';

  @override
  String get body => 'المحتوى';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get message => 'الرسالة';

  @override
  String get latitude => 'خط العرض';

  @override
  String get longitude => 'خط الطول';

  @override
  String get label => 'التسمية';

  @override
  String get eventTitle => 'عنوان الحدث';

  @override
  String get start => 'البداية';

  @override
  String get end => 'النهاية';

  @override
  String get location => 'الموقع';

  @override
  String get description => 'الوصف';

  @override
  String get notSet => 'غير محدد';

  @override
  String get barcodeData => 'بيانات الباركود';

  @override
  String createQr(String type) {
    return 'إنشاء QR لـ $type';
  }

  @override
  String createBarcode(String format) {
    return 'إنشاء $format';
  }

  @override
  String get privacyPolicyContent =>
      'سياسة الخصوصية\n\nيعالج هذا التطبيق جميع البيانات محلياً على جهازك. لا يتم إرسال أي بيانات شخصية أو نتائج مسح أو رموز مُنشأة إلى أي خادم خارجي.\n\nالوصول إلى الكاميرا\nتُستخدم الكاميرا فقط لمسح رموز QR والباركود. لا يتم تخزين الصور ما لم تقم بتفعيل إعداد \"تخزين الصور\" صراحةً.\n\nتخزين البيانات\nيتم تخزين جميع سجلات المسح والرموز المُنشأة محلياً على جهازك. يمكنك حذف هذه البيانات في أي وقت من شاشة السجل أو الإعدادات.\n\nخدمات الطرف الثالث\nلا يستخدم هذا التطبيق أي خدمات تحليلات أو إعلانات أو تتبع.\n\nالتواصل\nلأي استفسارات حول سياسة الخصوصية هذه، يرجى التواصل معنا على privacy@izmaze.com.';
}
