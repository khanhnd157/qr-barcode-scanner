// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'QR 및 바코드 스캐너';

  @override
  String get scan => '스캔';

  @override
  String get generate => '생성';

  @override
  String get history => '기록';

  @override
  String get favorites => '즐겨찾기';

  @override
  String get settings => '설정';

  @override
  String get result => '결과';

  @override
  String get qrCode => 'QR 코드';

  @override
  String get barcode => '바코드';

  @override
  String get scanned => '스캔됨';

  @override
  String get created => '생성됨';

  @override
  String get text => '텍스트';

  @override
  String get url => 'URL';

  @override
  String get phone => '전화';

  @override
  String get email => '이메일';

  @override
  String get wifi => 'Wi-Fi';

  @override
  String get contact => '연락처/VCard';

  @override
  String get sms => 'SMS';

  @override
  String get geolocation => '위치정보';

  @override
  String get calendar => '캘린더';

  @override
  String get clipboard => '클립보드';

  @override
  String get application => '애플리케이션';

  @override
  String get copy => '복사';

  @override
  String get share => '공유';

  @override
  String get save => '저장';

  @override
  String get delete => '삭제';

  @override
  String get cancel => '취소';

  @override
  String get confirm => '확인';

  @override
  String get done => '완료';

  @override
  String get clear => '지우기';

  @override
  String get clearAll => '모두 지우기';

  @override
  String get clearScanned => '스캔 기록 지우기';

  @override
  String get clearCreated => '생성 기록 지우기';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get actions => '작업';

  @override
  String get rawData => '원본 데이터';

  @override
  String get openInBrowser => '브라우저에서 열기';

  @override
  String get copyUrl => 'URL 복사';

  @override
  String get copyPassword => '비밀번호 복사';

  @override
  String get copyNumber => '번호 복사';

  @override
  String get call => '전화걸기';

  @override
  String get sendEmail => '이메일 보내기';

  @override
  String get sendSms => 'SMS 보내기';

  @override
  String get addContact => '연락처 추가';

  @override
  String get openInMaps => '지도에서 열기';

  @override
  String get addToCalendar => '캘린더에 추가';

  @override
  String get searchWeb => '웹 검색';

  @override
  String get wifiSettings => 'Wi-Fi 설정';

  @override
  String get copiedToClipboard => '클립보드에 복사됨';

  @override
  String get urlCopied => 'URL 복사됨';

  @override
  String get passwordCopied => '비밀번호 복사됨';

  @override
  String get numberCopied => '번호 복사됨';

  @override
  String get contactDataCopied => '연락처 데이터가 클립보드에 복사됨';

  @override
  String get passwordCopiedConnectWifi => '비밀번호 복사됨 — Wi-Fi 설정에서 연결하세요';

  @override
  String get openingWifiSettings => 'Wi-Fi 설정을 여는 중';

  @override
  String get savedToGallery => '갤러리에 저장됨';

  @override
  String get noCodeFoundInImage => '이미지에서 QR 코드 또는 바코드를 찾을 수 없습니다';

  @override
  String get bulkScanMode => '일괄 스캔 모드';

  @override
  String get bulkScanPointAtCodes => '일괄 스캔 — 코드를 향해 비추세요';

  @override
  String nScanned(int count) {
    return '$count개 스캔됨';
  }

  @override
  String get bulk => '일괄';

  @override
  String get flashOn => '플래시 켜기';

  @override
  String get flashOff => '플래시 끄기';

  @override
  String get gallery => '갤러리';

  @override
  String get scanFromGallery => '갤러리에서 스캔';

  @override
  String get noHistoryYet => '아직 기록이 없습니다';

  @override
  String get noScannedResults => '스캔 결과가 없습니다';

  @override
  String get noCreatedResults => '생성 결과가 없습니다';

  @override
  String get scanToSeeHere => 'QR 코드 또는 바코드를 스캔하면 여기에 표시됩니다';

  @override
  String get generateToSeeHere => 'QR 코드 또는 바코드를 생성하면 여기에 표시됩니다';

  @override
  String get noFavoritesYet => '아직 즐겨찾기가 없습니다';

  @override
  String get starItemsToSaveHere => '스캔 결과 또는 기록에서 별표를 눌러 여기에 저장하세요';

  @override
  String get clearHistory => '기록 지우기';

  @override
  String get deleteAllHistoryItems => '모든 기록 항목을 삭제하시겠습니까?';

  @override
  String get deleteAllScannedResults => '모든 스캔 결과를 삭제하시겠습니까?';

  @override
  String get deleteAllCreatedResults => '모든 생성 결과를 삭제하시겠습니까?';

  @override
  String get deleteItem => '이 항목을 삭제하시겠습니까?';

  @override
  String get searchHistory => '기록 검색...';

  @override
  String get appearance => '외관';

  @override
  String get theme => '테마';

  @override
  String get chooseTheme => '테마 선택';

  @override
  String get systemTheme => '시스템';

  @override
  String get lightTheme => '라이트';

  @override
  String get darkTheme => '다크';

  @override
  String get scanSettings => '스캔';

  @override
  String get vibrate => '진동';

  @override
  String get vibrateDesc => '스캔 성공 시 진동';

  @override
  String get beepSound => '비프음';

  @override
  String get beepDesc => '스캔 성공 시 소리 재생';

  @override
  String get bulkScanModeTitle => '일괄 스캔 모드';

  @override
  String get bulkScanModeDesc => '여러 코드를 연속으로 스캔';

  @override
  String get openUrlAutomatically => '자동으로 URL 열기';

  @override
  String get openUrlDesc => '스캔 후 브라우저에서 링크 열기';

  @override
  String get dataSettings => '데이터';

  @override
  String get saveHistory => '스캔 기록 저장';

  @override
  String get saveHistoryDesc => '스캔 결과를 자동으로 저장';

  @override
  String get storeImages => '이미지 저장';

  @override
  String get storeImagesDesc => '생성된 QR/바코드 이미지 저장';

  @override
  String get copyToClipboard => '클립보드에 복사';

  @override
  String get copyToClipboardDesc => '스캔 결과를 클립보드에 자동 복사';

  @override
  String get about => '정보';

  @override
  String get aboutTitle => '정보';

  @override
  String get rateUs => '평가하기';

  @override
  String get privacyPolicy => '개인정보처리방침';

  @override
  String get version => '버전';

  @override
  String get cameraPermissionRequired => '카메라 권한 필요';

  @override
  String get cameraPermissionMessage =>
      'QR 코드 및 바코드를 스캔하려면 카메라 접근 권한이 필요합니다. 기기 설정에서 카메라 권한을 허용해 주세요.';

  @override
  String get cameraError => '카메라 오류';

  @override
  String get cameraErrorMessage => '카메라를 시작할 수 없습니다. 앱을 닫았다가 다시 열어보세요.';

  @override
  String get openSettings => '설정 열기';

  @override
  String get enterText => '텍스트 입력';

  @override
  String get enterPackageName => '패키지 이름 또는 App Store ID 입력';

  @override
  String get enterTextFromClipboard => '클립보드에서 텍스트 입력';

  @override
  String get networkName => '네트워크 이름 (SSID)';

  @override
  String get password => '비밀번호';

  @override
  String get security => '보안';

  @override
  String get hiddenNetwork => '숨겨진 네트워크';

  @override
  String get fullName => '이름';

  @override
  String get company => '회사';

  @override
  String get address => '주소';

  @override
  String get website => '웹사이트';

  @override
  String get emailAddress => '이메일 주소';

  @override
  String get subject => '제목';

  @override
  String get body => '본문';

  @override
  String get phoneNumber => '전화번호';

  @override
  String get message => '메시지';

  @override
  String get latitude => '위도';

  @override
  String get longitude => '경도';

  @override
  String get label => '라벨';

  @override
  String get eventTitle => '일정 제목';

  @override
  String get start => '시작';

  @override
  String get end => '종료';

  @override
  String get location => '장소';

  @override
  String get description => '설명';

  @override
  String get notSet => '설정되지 않음';

  @override
  String get barcodeData => '바코드 데이터';

  @override
  String createQr(String type) {
    return '$type QR 생성';
  }

  @override
  String createBarcode(String format) {
    return '$format 생성';
  }

  @override
  String get privacyPolicyContent =>
      '개인정보처리방침\n\n이 애플리케이션은 모든 데이터를 사용자의 기기에서 로컬로 처리합니다. 개인 데이터, 스캔 결과 또는 생성된 코드는 외부 서버로 전송되지 않습니다.\n\n카메라 접근\n카메라는 QR 코드 및 바코드 스캔 목적으로만 사용됩니다. \"이미지 저장\" 설정을 명시적으로 활성화하지 않는 한 이미지는 저장되지 않습니다.\n\n데이터 저장\n모든 스캔 기록 및 생성된 코드는 사용자의 기기에 로컬로 저장됩니다. 기록 화면 또는 설정에서 언제든지 이 데이터를 삭제할 수 있습니다.\n\n제3자 서비스\n이 앱은 분석, 광고 또는 추적 서비스를 사용하지 않습니다.\n\n문의\n이 개인정보처리방침에 대한 질문이 있으시면 privacy@izmaze.com으로 연락해 주세요.';
}
