import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scanner_generator/core/constants/app_constants.dart';
import 'package:qr_scanner_generator/core/utils/url_launcher_util.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';
import 'package:qr_scanner_generator/shared/enums/theme_mode_option.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final settingsDao = ref.watch(settingsDaoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const _SectionHeader(title: 'APPEARANCE'),
          _ThemeModeTile(
            currentMode: settings.themeMode,
            onChanged: (mode) => settingsDao.updateThemeMode(mode),
          ),
          _LanguageTile(
            currentLanguage: settings.language,
            onChanged: (lang) => settingsDao.updateLanguage(lang),
          ),
          const Divider(height: 1),

          const _SectionHeader(title: 'SCAN'),
          _SwitchTile(
            title: 'Vibrate',
            subtitle: 'Vibrate on successful scan',
            icon: Icons.vibration,
            value: settings.vibrateEnabled,
            onChanged: (v) => settingsDao.updateVibrate(v),
          ),
          _SwitchTile(
            title: 'Beep Sound',
            subtitle: 'Play sound on successful scan',
            icon: Icons.volume_up,
            value: settings.beepEnabled,
            onChanged: (v) => settingsDao.updateBeep(v),
          ),
          _SwitchTile(
            title: 'Bulk Scan Mode',
            subtitle: 'Scan multiple codes continuously',
            icon: Icons.burst_mode,
            value: settings.bulkScanMode,
            onChanged: (v) => settingsDao.updateBulkScanMode(v),
          ),
          _SwitchTile(
            title: 'Open URL Automatically',
            subtitle: 'Open links in browser after scan',
            icon: Icons.open_in_browser,
            value: settings.autoOpenUrl,
            onChanged: (v) => settingsDao.updateAutoOpenUrl(v),
          ),
          const Divider(height: 1),

          const _SectionHeader(title: 'DATA'),
          _SwitchTile(
            title: 'Save Scan History',
            subtitle: 'Automatically save scanned results',
            icon: Icons.history,
            value: settings.saveHistory,
            onChanged: (v) => settingsDao.updateSaveHistory(v),
          ),
          _SwitchTile(
            title: 'Store Images',
            subtitle: 'Save generated QR/barcode images',
            icon: Icons.image,
            value: settings.storeImages,
            onChanged: (v) => settingsDao.updateStoreImages(v),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: const Text('Manage Stored Images'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/stored-images'),
          ),
          _SwitchTile(
            title: 'Copy to Clipboard',
            subtitle: 'Auto-copy scan result to clipboard',
            icon: Icons.content_copy,
            value: settings.autoCopyClipboard,
            onChanged: (v) => settingsDao.updateAutoCopyClipboard(v),
          ),
          const Divider(height: 1),

          const _SectionHeader(title: 'ABOUT'),
          ListTile(
            leading: const Icon(Icons.thumb_up_outlined),
            title: const Text('Rate Us'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              UrlLauncherUtil.openUrl(
                'https://play.google.com/store/apps/details?id=${AppConstants.appId}',
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/privacy'),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            subtitle: const Text('Version ${AppConstants.appVersion}'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: AppConstants.appName,
                applicationVersion: AppConstants.appVersion,
                applicationLegalese:
                    '\u00a9 2026 izmaze. All rights reserved.',
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'A fast, offline QR code and barcode scanner and generator. '
                    'All data is processed locally on your device.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String currentLanguage;
  final ValueChanged<String> onChanged;

  const _LanguageTile({
    required this.currentLanguage,
    required this.onChanged,
  });

  static const _languages = {
    'en': 'English',
    'vi': 'Tiếng Việt',
  };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text('Language'),
      subtitle: Text(_languages[currentLanguage] ?? currentLanguage),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Choose Language',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                RadioGroup<String>(
                  groupValue: currentLanguage,
                  onChanged: (value) {
                    if (value != null) {
                      onChanged(value);
                      Navigator.pop(context);
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _languages.entries.map(
                      (entry) => RadioListTile<String>(
                        title: Text(entry.value),
                        value: entry.key,
                      ),
                    ).toList(),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ThemeModeTile extends StatelessWidget {
  final ThemeModeOption currentMode;
  final ValueChanged<ThemeModeOption> onChanged;

  const _ThemeModeTile({
    required this.currentMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(currentMode.icon),
      title: const Text('Theme'),
      subtitle: Text(currentMode.label),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Choose Theme',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                RadioGroup<ThemeModeOption>(
                  groupValue: currentMode,
                  onChanged: (value) {
                    if (value != null) {
                      onChanged(value);
                      Navigator.pop(context);
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: ThemeModeOption.values.map(
                      (mode) => RadioListTile<ThemeModeOption>(
                        title: Text(mode.label),
                        secondary: Icon(mode.icon),
                        value: mode,
                      ),
                    ).toList(),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}
