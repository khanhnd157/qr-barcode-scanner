// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '二维码和条形码扫描器';

  @override
  String get scan => '扫描';

  @override
  String get generate => '生成';

  @override
  String get history => '历史';

  @override
  String get favorites => '收藏';

  @override
  String get settings => '设置';

  @override
  String get result => '结果';

  @override
  String get qrCode => '二维码';

  @override
  String get barcode => '条形码';

  @override
  String get scanned => '已扫描';

  @override
  String get created => '已创建';

  @override
  String get text => '文本';

  @override
  String get url => 'URL';

  @override
  String get phone => '电话';

  @override
  String get email => '邮箱';

  @override
  String get wifi => 'Wi-Fi';

  @override
  String get contact => '联系人/VCard';

  @override
  String get sms => '短信';

  @override
  String get geolocation => '地理位置';

  @override
  String get calendar => '日历';

  @override
  String get clipboard => '剪贴板';

  @override
  String get application => '应用';

  @override
  String get copy => '复制';

  @override
  String get share => '分享';

  @override
  String get save => '保存';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确认';

  @override
  String get done => '完成';

  @override
  String get clear => '清除';

  @override
  String get clearAll => '清除全部';

  @override
  String get clearScanned => '清除已扫描';

  @override
  String get clearCreated => '清除已创建';

  @override
  String get tryAgain => '重试';

  @override
  String get actions => '操作';

  @override
  String get rawData => '原始数据';

  @override
  String get openInBrowser => '在浏览器中打开';

  @override
  String get copyUrl => '复制 URL';

  @override
  String get copyPassword => '复制密码';

  @override
  String get copyNumber => '复制号码';

  @override
  String get call => '拨打电话';

  @override
  String get sendEmail => '发送邮件';

  @override
  String get sendSms => '发送短信';

  @override
  String get addContact => '添加联系人';

  @override
  String get openInMaps => '在地图中打开';

  @override
  String get addToCalendar => '添加到日历';

  @override
  String get searchWeb => '搜索网页';

  @override
  String get wifiSettings => 'Wi-Fi 设置';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get urlCopied => '已复制 URL';

  @override
  String get passwordCopied => '已复制密码';

  @override
  String get numberCopied => '已复制号码';

  @override
  String get contactDataCopied => '联系人数据已复制到剪贴板';

  @override
  String get passwordCopiedConnectWifi => '密码已复制 — 请前往 Wi-Fi 设置连接';

  @override
  String get openingWifiSettings => '正在打开 Wi-Fi 设置';

  @override
  String get savedToGallery => '已保存到相册';

  @override
  String get noCodeFoundInImage => '未在图片中找到二维码或条形码';

  @override
  String get bulkScanMode => '批量扫描模式';

  @override
  String get bulkScanPointAtCodes => '批量扫描 — 对准码';

  @override
  String nScanned(int count) {
    return '已扫描 $count 个';
  }

  @override
  String get bulk => '批量';

  @override
  String get flashOn => '开启闪光灯';

  @override
  String get flashOff => '关闭闪光灯';

  @override
  String get gallery => '相册';

  @override
  String get scanFromGallery => '从相册扫描';

  @override
  String get noHistoryYet => '暂无历史记录';

  @override
  String get noScannedResults => '暂无扫描结果';

  @override
  String get noCreatedResults => '暂无创建结果';

  @override
  String get scanToSeeHere => '扫描二维码或条形码后将显示在此处';

  @override
  String get generateToSeeHere => '生成二维码或条形码后将显示在此处';

  @override
  String get noFavoritesYet => '暂无收藏';

  @override
  String get starItemsToSaveHere => '在扫描结果或历史记录中点击星标即可收藏到此处';

  @override
  String get clearHistory => '清除历史记录';

  @override
  String get deleteAllHistoryItems => '删除所有历史记录？';

  @override
  String get deleteAllScannedResults => '删除所有扫描结果？';

  @override
  String get deleteAllCreatedResults => '删除所有创建结果？';

  @override
  String get deleteItem => '确定要删除此项吗？';

  @override
  String get searchHistory => '搜索历史记录...';

  @override
  String get appearance => '外观';

  @override
  String get theme => '主题';

  @override
  String get chooseTheme => '选择主题';

  @override
  String get systemTheme => '跟随系统';

  @override
  String get lightTheme => '浅色';

  @override
  String get darkTheme => '深色';

  @override
  String get scanSettings => '扫描';

  @override
  String get vibrate => '振动';

  @override
  String get vibrateDesc => '扫描成功时振动';

  @override
  String get beepSound => '提示音';

  @override
  String get beepDesc => '扫描成功时播放提示音';

  @override
  String get bulkScanModeTitle => '批量扫描模式';

  @override
  String get bulkScanModeDesc => '连续扫描多个码';

  @override
  String get openUrlAutomatically => '自动打开 URL';

  @override
  String get openUrlDesc => '扫描后自动在浏览器中打开链接';

  @override
  String get dataSettings => '数据';

  @override
  String get saveHistory => '保存扫描历史';

  @override
  String get saveHistoryDesc => '自动保存扫描结果';

  @override
  String get storeImages => '存储图片';

  @override
  String get storeImagesDesc => '保存生成的二维码/条形码图片';

  @override
  String get copyToClipboard => '复制到剪贴板';

  @override
  String get copyToClipboardDesc => '自动将扫描结果复制到剪贴板';

  @override
  String get about => '关于';

  @override
  String get aboutTitle => '关于';

  @override
  String get rateUs => '给我们评分';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get version => '版本';

  @override
  String get cameraPermissionRequired => '需要相机权限';

  @override
  String get cameraPermissionMessage => '此应用需要相机权限来扫描二维码和条形码。请在设备设置中授予相机权限。';

  @override
  String get cameraError => '相机错误';

  @override
  String get cameraErrorMessage => '无法启动相机。请尝试关闭并重新打开应用。';

  @override
  String get openSettings => '打开设置';

  @override
  String get enterText => '输入文本';

  @override
  String get enterPackageName => '输入包名或 App Store ID';

  @override
  String get enterTextFromClipboard => '从剪贴板输入文本';

  @override
  String get networkName => '网络名称 (SSID)';

  @override
  String get password => '密码';

  @override
  String get security => '安全性';

  @override
  String get hiddenNetwork => '隐藏网络';

  @override
  String get fullName => '姓名';

  @override
  String get company => '公司';

  @override
  String get address => '地址';

  @override
  String get website => '网站';

  @override
  String get emailAddress => '邮箱地址';

  @override
  String get subject => '主题';

  @override
  String get body => '正文';

  @override
  String get phoneNumber => '电话号码';

  @override
  String get message => '消息';

  @override
  String get latitude => '纬度';

  @override
  String get longitude => '经度';

  @override
  String get label => '标签';

  @override
  String get eventTitle => '事件标题';

  @override
  String get start => '开始';

  @override
  String get end => '结束';

  @override
  String get location => '位置';

  @override
  String get description => '描述';

  @override
  String get notSet => '未设置';

  @override
  String get barcodeData => '条形码数据';

  @override
  String createQr(String type) {
    return '创建$type二维码';
  }

  @override
  String createBarcode(String format) {
    return '创建$format';
  }

  @override
  String get privacyPolicyContent =>
      '隐私政策\n\n本应用在您的设备上本地处理所有数据。不会将任何个人数据、扫描结果或生成的码发送到任何外部服务器。\n\n相机访问\n相机仅用于扫描二维码和条形码。除非您明确启用\'存储图片\'设置，否则不会存储图片。\n\n数据存储\n所有扫描历史和生成的码均存储在您的设备本地。您可以随时从历史记录或设置中删除这些数据。\n\n第三方服务\n本应用不使用分析、广告或追踪服务。\n\n联系我们\n如对本隐私政策有任何疑问，请联系 privacy@izmaze.com。';
}
