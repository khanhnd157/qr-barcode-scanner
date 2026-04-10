// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Quét QR & Mã vạch';

  @override
  String get scan => 'Quét';

  @override
  String get generate => 'Tạo mã';

  @override
  String get history => 'Lịch sử';

  @override
  String get favorites => 'Yêu thích';

  @override
  String get settings => 'Cài đặt';

  @override
  String get result => 'Kết quả';

  @override
  String get qrCode => 'Mã QR';

  @override
  String get barcode => 'Mã vạch';

  @override
  String get scanned => 'Đã quét';

  @override
  String get created => 'Đã tạo';

  @override
  String get text => 'Văn bản';

  @override
  String get url => 'URL';

  @override
  String get phone => 'Điện thoại';

  @override
  String get email => 'Email';

  @override
  String get wifi => 'Wi-Fi';

  @override
  String get contact => 'Liên hệ/VCard';

  @override
  String get sms => 'SMS';

  @override
  String get geolocation => 'Vị trí';

  @override
  String get calendar => 'Lịch';

  @override
  String get clipboard => 'Bộ nhớ tạm';

  @override
  String get application => 'Ứng dụng';

  @override
  String get copy => 'Sao chép';

  @override
  String get share => 'Chia sẻ';

  @override
  String get save => 'Lưu';

  @override
  String get delete => 'Xóa';

  @override
  String get cancel => 'Hủy';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get done => 'Xong';

  @override
  String get clear => 'Xóa';

  @override
  String get clearAll => 'Xóa tất cả';

  @override
  String get clearScanned => 'Xóa đã quét';

  @override
  String get clearCreated => 'Xóa đã tạo';

  @override
  String get tryAgain => 'Thử lại';

  @override
  String get actions => 'Hành động';

  @override
  String get rawData => 'Dữ liệu gốc';

  @override
  String get openInBrowser => 'Mở trình duyệt';

  @override
  String get copyUrl => 'Sao chép URL';

  @override
  String get copyPassword => 'Sao chép mật khẩu';

  @override
  String get copyNumber => 'Sao chép số';

  @override
  String get call => 'Gọi';

  @override
  String get sendEmail => 'Gửi Email';

  @override
  String get sendSms => 'Gửi SMS';

  @override
  String get addContact => 'Thêm liên hệ';

  @override
  String get openInMaps => 'Mở bản đồ';

  @override
  String get addToCalendar => 'Thêm vào lịch';

  @override
  String get searchWeb => 'Tìm trên web';

  @override
  String get wifiSettings => 'Cài đặt Wi-Fi';

  @override
  String get copiedToClipboard => 'Đã sao chép';

  @override
  String get urlCopied => 'Đã sao chép URL';

  @override
  String get passwordCopied => 'Đã sao chép mật khẩu';

  @override
  String get numberCopied => 'Đã sao chép số';

  @override
  String get contactDataCopied => 'Đã sao chép dữ liệu liên hệ';

  @override
  String get passwordCopiedConnectWifi =>
      'Đã sao chép mật khẩu — mở cài đặt Wi-Fi để kết nối';

  @override
  String get openingWifiSettings => 'Đang mở cài đặt Wi-Fi';

  @override
  String get savedToGallery => 'Đã lưu vào thư viện';

  @override
  String get noCodeFoundInImage =>
      'Không tìm thấy mã QR hoặc mã vạch trong ảnh';

  @override
  String get bulkScanMode => 'Chế độ quét hàng loạt';

  @override
  String get bulkScanPointAtCodes => 'Quét hàng loạt — hướng vào mã';

  @override
  String nScanned(int count) {
    return '$count đã quét';
  }

  @override
  String get bulk => 'HÀNG LOẠT';

  @override
  String get flashOn => 'Bật đèn';

  @override
  String get flashOff => 'Tắt đèn';

  @override
  String get gallery => 'Thư viện';

  @override
  String get scanFromGallery => 'Quét từ thư viện ảnh';

  @override
  String get noHistoryYet => 'Chưa có lịch sử';

  @override
  String get noScannedResults => 'Chưa có kết quả quét';

  @override
  String get noCreatedResults => 'Chưa có kết quả tạo';

  @override
  String get scanToSeeHere => 'Quét mã QR hoặc mã vạch để xem tại đây';

  @override
  String get generateToSeeHere => 'Tạo mã QR hoặc mã vạch để xem tại đây';

  @override
  String get noFavoritesYet => 'Chưa có mục yêu thích';

  @override
  String get starItemsToSaveHere =>
      'Đánh dấu sao từ kết quả quét hoặc lịch sử để lưu tại đây';

  @override
  String get clearHistory => 'Xóa lịch sử';

  @override
  String get deleteAllHistoryItems => 'Xóa tất cả lịch sử?';

  @override
  String get deleteAllScannedResults => 'Xóa tất cả kết quả đã quét?';

  @override
  String get deleteAllCreatedResults => 'Xóa tất cả kết quả đã tạo?';

  @override
  String get deleteItem => 'Bạn có chắc muốn xóa mục này?';

  @override
  String get searchHistory => 'Tìm kiếm lịch sử...';

  @override
  String get appearance => 'GIAO DIỆN';

  @override
  String get theme => 'Chủ đề';

  @override
  String get chooseTheme => 'Chọn chủ đề';

  @override
  String get systemTheme => 'Hệ thống';

  @override
  String get lightTheme => 'Sáng';

  @override
  String get darkTheme => 'Tối';

  @override
  String get scanSettings => 'QUÉT';

  @override
  String get vibrate => 'Rung';

  @override
  String get vibrateDesc => 'Rung khi quét thành công';

  @override
  String get beepSound => 'Âm thanh';

  @override
  String get beepDesc => 'Phát âm thanh khi quét thành công';

  @override
  String get bulkScanModeTitle => 'Quét hàng loạt';

  @override
  String get bulkScanModeDesc => 'Quét nhiều mã liên tục';

  @override
  String get openUrlAutomatically => 'Tự động mở URL';

  @override
  String get openUrlDesc => 'Mở liên kết trong trình duyệt sau khi quét';

  @override
  String get dataSettings => 'DỮ LIỆU';

  @override
  String get saveHistory => 'Lưu lịch sử quét';

  @override
  String get saveHistoryDesc => 'Tự động lưu kết quả đã quét';

  @override
  String get storeImages => 'Lưu hình ảnh';

  @override
  String get storeImagesDesc => 'Lưu ảnh mã QR/mã vạch đã tạo';

  @override
  String get copyToClipboard => 'Sao chép vào bộ nhớ tạm';

  @override
  String get copyToClipboardDesc => 'Tự động sao chép kết quả quét';

  @override
  String get about => 'Giới thiệu';

  @override
  String get aboutTitle => 'GIỚI THIỆU';

  @override
  String get rateUs => 'Đánh giá';

  @override
  String get privacyPolicy => 'Chính sách bảo mật';

  @override
  String get version => 'Phiên bản';

  @override
  String get cameraPermissionRequired => 'Cần quyền truy cập Camera';

  @override
  String get cameraPermissionMessage =>
      'Ứng dụng cần quyền truy cập camera để quét mã QR và mã vạch. Vui lòng cấp quyền trong cài đặt thiết bị.';

  @override
  String get cameraError => 'Lỗi Camera';

  @override
  String get cameraErrorMessage =>
      'Không thể khởi động camera. Vui lòng thử đóng và mở lại ứng dụng.';

  @override
  String get openSettings => 'Mở cài đặt';

  @override
  String get enterText => 'Nhập văn bản';

  @override
  String get enterPackageName => 'Nhập tên gói hoặc App Store ID';

  @override
  String get enterTextFromClipboard => 'Nhập văn bản từ bộ nhớ tạm';

  @override
  String get networkName => 'Tên mạng (SSID)';

  @override
  String get password => 'Mật khẩu';

  @override
  String get security => 'Bảo mật';

  @override
  String get hiddenNetwork => 'Mạng ẩn';

  @override
  String get fullName => 'Họ và tên';

  @override
  String get company => 'Công ty';

  @override
  String get address => 'Địa chỉ';

  @override
  String get website => 'Website';

  @override
  String get emailAddress => 'Địa chỉ Email';

  @override
  String get subject => 'Chủ đề';

  @override
  String get body => 'Nội dung';

  @override
  String get phoneNumber => 'Số điện thoại';

  @override
  String get message => 'Tin nhắn';

  @override
  String get latitude => 'Vĩ độ';

  @override
  String get longitude => 'Kinh độ';

  @override
  String get label => 'Nhãn';

  @override
  String get eventTitle => 'Tên sự kiện';

  @override
  String get start => 'Bắt đầu';

  @override
  String get end => 'Kết thúc';

  @override
  String get location => 'Địa điểm';

  @override
  String get description => 'Mô tả';

  @override
  String get notSet => 'Chưa đặt';

  @override
  String get barcodeData => 'Dữ liệu mã vạch';

  @override
  String createQr(String type) {
    return 'Tạo QR $type';
  }

  @override
  String createBarcode(String format) {
    return 'Tạo $format';
  }

  @override
  String get privacyPolicyContent =>
      'Chính sách bảo mật\n\nỨng dụng này xử lý tất cả dữ liệu cục bộ trên thiết bị của bạn. Không có dữ liệu cá nhân, kết quả quét hoặc mã đã tạo nào được gửi đến máy chủ bên ngoài.\n\nTruy cập Camera\nCamera chỉ được sử dụng để quét mã QR và mã vạch. Hình ảnh không được lưu trữ trừ khi bạn bật cài đặt \"Lưu hình ảnh\".\n\nLưu trữ dữ liệu\nTất cả lịch sử quét và mã đã tạo được lưu cục bộ trên thiết bị. Bạn có thể xóa dữ liệu này bất cứ lúc nào từ màn hình Lịch sử hoặc Cài đặt.\n\nDịch vụ bên thứ ba\nỨng dụng này không sử dụng dịch vụ phân tích, quảng cáo hoặc theo dõi.\n\nLiên hệ\nĐể biết thêm về chính sách bảo mật, vui lòng liên hệ privacy@izmaze.com.';
}
