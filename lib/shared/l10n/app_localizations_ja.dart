// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'QR・バーコードスキャナー';

  @override
  String get scan => 'スキャン';

  @override
  String get generate => '生成';

  @override
  String get history => '履歴';

  @override
  String get favorites => 'お気に入り';

  @override
  String get settings => '設定';

  @override
  String get result => '結果';

  @override
  String get qrCode => 'QRコード';

  @override
  String get barcode => 'バーコード';

  @override
  String get scanned => 'スキャン済み';

  @override
  String get created => '作成済み';

  @override
  String get text => 'テキスト';

  @override
  String get url => 'URL';

  @override
  String get phone => '電話';

  @override
  String get email => 'メール';

  @override
  String get wifi => 'Wi-Fi';

  @override
  String get contact => '連絡先/VCard';

  @override
  String get sms => 'SMS';

  @override
  String get geolocation => '位置情報';

  @override
  String get calendar => 'カレンダー';

  @override
  String get clipboard => 'クリップボード';

  @override
  String get application => 'アプリケーション';

  @override
  String get copy => 'コピー';

  @override
  String get share => '共有';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確認';

  @override
  String get done => '完了';

  @override
  String get clear => 'クリア';

  @override
  String get clearAll => 'すべてクリア';

  @override
  String get clearScanned => 'スキャン履歴をクリア';

  @override
  String get clearCreated => '作成履歴をクリア';

  @override
  String get tryAgain => '再試行';

  @override
  String get actions => 'アクション';

  @override
  String get rawData => '生データ';

  @override
  String get openInBrowser => 'ブラウザで開く';

  @override
  String get copyUrl => 'URLをコピー';

  @override
  String get copyPassword => 'パスワードをコピー';

  @override
  String get copyNumber => '番号をコピー';

  @override
  String get call => '電話をかける';

  @override
  String get sendEmail => 'メールを送信';

  @override
  String get sendSms => 'SMSを送信';

  @override
  String get addContact => '連絡先に追加';

  @override
  String get openInMaps => 'マップで開く';

  @override
  String get addToCalendar => 'カレンダーに追加';

  @override
  String get searchWeb => 'ウェブ検索';

  @override
  String get wifiSettings => 'Wi-Fi設定';

  @override
  String get copiedToClipboard => 'クリップボードにコピーしました';

  @override
  String get urlCopied => 'URLをコピーしました';

  @override
  String get passwordCopied => 'パスワードをコピーしました';

  @override
  String get numberCopied => '番号をコピーしました';

  @override
  String get contactDataCopied => '連絡先データをクリップボードにコピーしました';

  @override
  String get passwordCopiedConnectWifi => 'パスワードをコピーしました — Wi-Fi設定から接続してください';

  @override
  String get openingWifiSettings => 'Wi-Fi設定を開いています';

  @override
  String get savedToGallery => 'ギャラリーに保存しました';

  @override
  String get noCodeFoundInImage => '画像にQRコードまたはバーコードが見つかりません';

  @override
  String get bulkScanMode => '一括スキャンモード';

  @override
  String get bulkScanPointAtCodes => '一括スキャン — コードに向けてください';

  @override
  String nScanned(int count) {
    return '$count件スキャン済み';
  }

  @override
  String get bulk => '一括';

  @override
  String get flashOn => 'フラッシュオン';

  @override
  String get flashOff => 'フラッシュオフ';

  @override
  String get gallery => 'ギャラリー';

  @override
  String get scanFromGallery => 'ギャラリーからスキャン';

  @override
  String get noHistoryYet => '履歴がありません';

  @override
  String get noScannedResults => 'スキャン結果がありません';

  @override
  String get noCreatedResults => '作成結果がありません';

  @override
  String get scanToSeeHere => 'QRコードまたはバーコードをスキャンすると、ここに表示されます';

  @override
  String get generateToSeeHere => 'QRコードまたはバーコードを生成すると、ここに表示されます';

  @override
  String get noFavoritesYet => 'お気に入りがありません';

  @override
  String get starItemsToSaveHere => 'スキャン結果や履歴からスター付きにすると、ここに保存されます';

  @override
  String get clearHistory => '履歴をクリア';

  @override
  String get deleteAllHistoryItems => 'すべての履歴項目を削除しますか？';

  @override
  String get deleteAllScannedResults => 'すべてのスキャン結果を削除しますか？';

  @override
  String get deleteAllCreatedResults => 'すべての作成結果を削除しますか？';

  @override
  String get deleteItem => 'この項目を削除してもよろしいですか？';

  @override
  String get searchHistory => '履歴を検索...';

  @override
  String get appearance => '外観';

  @override
  String get theme => 'テーマ';

  @override
  String get chooseTheme => 'テーマを選択';

  @override
  String get systemTheme => 'システム';

  @override
  String get lightTheme => 'ライト';

  @override
  String get darkTheme => 'ダーク';

  @override
  String get scanSettings => 'スキャン';

  @override
  String get vibrate => 'バイブレーション';

  @override
  String get vibrateDesc => 'スキャン成功時にバイブレーション';

  @override
  String get beepSound => 'ビープ音';

  @override
  String get beepDesc => 'スキャン成功時に音を鳴らす';

  @override
  String get bulkScanModeTitle => '一括スキャンモード';

  @override
  String get bulkScanModeDesc => '複数のコードを連続してスキャン';

  @override
  String get openUrlAutomatically => 'URLを自動で開く';

  @override
  String get openUrlDesc => 'スキャン後にリンクをブラウザで開く';

  @override
  String get dataSettings => 'データ';

  @override
  String get saveHistory => 'スキャン履歴を保存';

  @override
  String get saveHistoryDesc => 'スキャン結果を自動的に保存';

  @override
  String get storeImages => '画像を保存';

  @override
  String get storeImagesDesc => '生成したQR・バーコード画像を保存';

  @override
  String get copyToClipboard => 'クリップボードにコピー';

  @override
  String get copyToClipboardDesc => 'スキャン結果を自動的にクリップボードにコピー';

  @override
  String get about => 'アプリについて';

  @override
  String get aboutTitle => 'アプリ情報';

  @override
  String get rateUs => 'アプリを評価';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get version => 'バージョン';

  @override
  String get cameraPermissionRequired => 'カメラの許可が必要です';

  @override
  String get cameraPermissionMessage =>
      'QRコードやバーコードをスキャンするには、カメラへのアクセスが必要です。デバイスの設定でカメラの許可を有効にしてください。';

  @override
  String get cameraError => 'カメラエラー';

  @override
  String get cameraErrorMessage => 'カメラを起動できません。アプリを閉じてから再度開いてみてください。';

  @override
  String get openSettings => '設定を開く';

  @override
  String get enterText => 'テキストを入力';

  @override
  String get enterPackageName => 'パッケージ名またはApp Store IDを入力';

  @override
  String get enterTextFromClipboard => 'クリップボードからテキストを入力';

  @override
  String get networkName => 'ネットワーク名 (SSID)';

  @override
  String get password => 'パスワード';

  @override
  String get security => 'セキュリティ';

  @override
  String get hiddenNetwork => '非公開ネットワーク';

  @override
  String get fullName => '氏名';

  @override
  String get company => '会社名';

  @override
  String get address => '住所';

  @override
  String get website => 'ウェブサイト';

  @override
  String get emailAddress => 'メールアドレス';

  @override
  String get subject => '件名';

  @override
  String get body => '本文';

  @override
  String get phoneNumber => '電話番号';

  @override
  String get message => 'メッセージ';

  @override
  String get latitude => '緯度';

  @override
  String get longitude => '経度';

  @override
  String get label => 'ラベル';

  @override
  String get eventTitle => 'イベントタイトル';

  @override
  String get start => '開始';

  @override
  String get end => '終了';

  @override
  String get location => '場所';

  @override
  String get description => '説明';

  @override
  String get notSet => '未設定';

  @override
  String get barcodeData => 'バーコードデータ';

  @override
  String createQr(String type) {
    return '$type QRを作成';
  }

  @override
  String createBarcode(String format) {
    return '$formatを作成';
  }

  @override
  String get privacyPolicyContent =>
      'プライバシーポリシー\n\n本アプリケーションは、すべてのデータをお使いのデバイス上でローカルに処理します。個人データ、スキャン結果、生成されたコードが外部サーバーに送信されることはありません。\n\nカメラへのアクセス\nカメラはQRコードおよびバーコードのスキャンのみに使用されます。「画像を保存」設定を明示的に有効にしない限り、画像は保存されません。\n\nデータの保存\nすべてのスキャン履歴と生成されたコードは、お使いのデバイスにローカルに保存されます。このデータは、履歴画面または設定からいつでも削除できます。\n\nサードパーティサービス\n本アプリは、分析、広告、またはトラッキングサービスを使用していません。\n\nお問い合わせ\n本プライバシーポリシーに関するご質問は、privacy@izmaze.com までご連絡ください。';
}
