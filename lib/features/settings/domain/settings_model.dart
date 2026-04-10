import 'package:qr_scanner_generator/shared/enums/theme_mode_option.dart';

class AppSettings {
  final ThemeModeOption themeMode;
  final String language;
  final bool beepEnabled;
  final bool vibrateEnabled;
  final bool saveHistory;
  final bool storeImages;
  final bool autoCopyClipboard;
  final bool autoOpenUrl;
  final bool bulkScanMode;

  const AppSettings({
    required this.themeMode,
    required this.language,
    required this.beepEnabled,
    required this.vibrateEnabled,
    required this.saveHistory,
    required this.storeImages,
    required this.autoCopyClipboard,
    required this.autoOpenUrl,
    required this.bulkScanMode,
  });

  factory AppSettings.defaults() => const AppSettings(
        themeMode: ThemeModeOption.system,
        language: 'en',
        beepEnabled: true,
        vibrateEnabled: true,
        saveHistory: true,
        storeImages: false,
        autoCopyClipboard: false,
        autoOpenUrl: false,
        bulkScanMode: false,
      );
}
