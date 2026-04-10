import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_scanner_generator/core/utils/clipboard_util.dart';
import 'package:qr_scanner_generator/core/utils/share_util.dart';
import 'package:qr_scanner_generator/core/utils/url_launcher_util.dart';
import 'package:qr_scanner_generator/features/result/domain/action_resolver.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';
import 'package:qr_scanner_generator/shared/enums/code_content.dart';
import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/models/scan_record_model.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class ResultScreen extends ConsumerStatefulWidget {
  final ScanRecordModel record;

  const ResultScreen({super.key, required this.record});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  late final ParsedPayload _parsed;
  late final List<ResultAction> _actions;
  bool _isFavorite = false;
  bool _didAutoOpen = false;

  @override
  void initState() {
    super.initState();
    _parsed = ContentParser.parse(widget.record.rawValue);
    _actions = ActionResolver.resolve(_parsed);
    _isFavorite = widget.record.isFavorite;

    // Auto-open URL after frame renders
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryAutoOpenUrl();
    });
  }

  void _tryAutoOpenUrl() {
    if (_didAutoOpen) return;
    _didAutoOpen = true;

    final settings = ref.read(settingsProvider);
    if (!settings.autoOpenUrl) return;

    if (_parsed case UrlPayload(:final url)) {
      UrlLauncherUtil.openUrl(url);
    }
  }

  void _toggleFavorite() {
    final recordId = widget.record.id;
    if (recordId == null) return;

    setState(() => _isFavorite = !_isFavorite);
    ref.read(scanRecordDaoProvider).toggleFavorite(recordId, _isFavorite);
  }

  Future<void> _handleAction(ResultAction action) async {
    switch (action) {
      case ResultAction.openBrowser:
        if (_parsed case UrlPayload(:final url)) {
          UrlLauncherUtil.openUrl(url);
        }
      case ResultAction.copyUrl:
        if (_parsed case UrlPayload(:final url)) {
          await ClipboardUtil.copy(url);
          _showSnackBar('URL copied');
        }
      case ResultAction.copyText:
        await ClipboardUtil.copy(widget.record.rawValue);
        _showSnackBar('Copied to clipboard');
      case ResultAction.copyPassword:
        if (_parsed case WifiPayload(:final password)) {
          if (password != null) {
            await ClipboardUtil.copy(password);
            _showSnackBar('Password copied');
          }
        }
      case ResultAction.copyNumber:
        if (_parsed case PhonePayload(:final number)) {
          await ClipboardUtil.copy(number);
          _showSnackBar('Number copied');
        }
      case ResultAction.share:
        if (widget.record.imagePath != null) {
          await ShareUtil.shareFile(widget.record.imagePath!);
        } else {
          await ShareUtil.shareText(widget.record.rawValue);
        }
      case ResultAction.call:
        final number = switch (_parsed) {
          PhonePayload(:final number) => number,
          ContactPayload(:final phone) => phone,
          _ => null,
        };
        if (number != null) UrlLauncherUtil.call(number);
      case ResultAction.sendEmail:
        final email = switch (_parsed) {
          EmailPayload(:final address, :final subject, :final body) =>
            (address, subject, body),
          ContactPayload(:final email) => (email, null, null),
          _ => null,
        };
        if (email != null && email.$1 != null) {
          UrlLauncherUtil.sendEmail(
            email.$1!,
            subject: email.$2,
            body: email.$3,
          );
        }
      case ResultAction.sendSms:
        final data = switch (_parsed) {
          SmsPayload(:final number, :final message) => (number, message),
          PhonePayload(:final number) => (number, null),
          _ => null,
        };
        if (data != null) {
          UrlLauncherUtil.sendSms(data.$1, body: data.$2);
        }
      case ResultAction.addContact:
        if (_parsed case ContactPayload(:final rawVcard)) {
          final ok = await UrlLauncherUtil.addContactFromVcard(rawVcard);
          if (!ok && mounted) {
            await ClipboardUtil.copy(rawVcard);
            _showSnackBar('Contact data copied to clipboard');
          }
        }
      case ResultAction.openMaps:
        if (_parsed case GeoPayload(:final latitude, :final longitude)) {
          UrlLauncherUtil.openMap(latitude, longitude);
        }
      case ResultAction.addCalendar:
        if (_parsed
            case CalendarPayload(
              :final summary,
              :final dtStart,
              :final dtEnd,
              :final location,
              :final description,
            )) {
          UrlLauncherUtil.addCalendarEvent(
            title: summary ?? 'Event',
            begin: dtStart,
            end: dtEnd,
            location: location,
            description: description,
          );
        }
      case ResultAction.searchWeb:
        if (_parsed case ProductPayload(:final code)) {
          UrlLauncherUtil.openUrl(
            'https://www.google.com/search?q=$code+barcode',
          );
        }
      case ResultAction.connectWifi:
        if (_parsed case WifiPayload(:final password)) {
          if (password != null && password.isNotEmpty) {
            await ClipboardUtil.copy(password);
          }
          await UrlLauncherUtil.openWifiSettings();
          if (mounted) {
            _showSnackBar(password != null && password.isNotEmpty
                ? 'Password copied — connect in Wi-Fi settings'
                : 'Opening Wi-Fi settings');
          }
        }
    }
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: [
          if (widget.record.id != null)
            IconButton(
              icon: Icon(
                _isFavorite ? Icons.star : Icons.star_border,
                color: _isFavorite ? Colors.amber : null,
              ),
              onPressed: _toggleFavorite,
            ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              if (widget.record.imagePath != null) {
                ShareUtil.shareFile(widget.record.imagePath!);
              } else {
                ShareUtil.shareText(widget.record.rawValue);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Type header with timestamp
            _TypeHeader(
              contentType: widget.record.contentType,
              codeFormat: widget.record.codeFormat.label,
              sourceType: widget.record.sourceType.label,
              createdAt: widget.record.createdAt,
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
            const SizedBox(height: 20),

            // Saved image preview (for generated codes)
            if (widget.record.imagePath != null) ...[
              _ImagePreview(
                imagePath: widget.record.imagePath!,
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 20),
            ],

            // Content card
            _ContentCard(
              parsed: _parsed,
              rawValue: widget.record.rawValue,
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
            const SizedBox(height: 24),

            // Action buttons
            Text(
              'Actions',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _actions.map((action) {
                final isPrimary = action == _actions.first;
                return isPrimary
                    ? FilledButton.icon(
                        onPressed: () => _handleAction(action),
                        icon: Icon(action.icon, size: 18),
                        label: Text(action.label),
                      )
                    : OutlinedButton.icon(
                        onPressed: () => _handleAction(action),
                        icon: Icon(action.icon, size: 18),
                        label: Text(action.label),
                      );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Raw data
            ExpansionTile(
              title: const Text('Raw Data'),
              tilePadding: EdgeInsets.zero,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SelectableText(
                    widget.record.rawValue,
                    style: textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private widgets
// ---------------------------------------------------------------------------

class _TypeHeader extends StatelessWidget {
  final CodeContent contentType;
  final String codeFormat;
  final String sourceType;
  final DateTime createdAt;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _TypeHeader({
    required this.contentType,
    required this.codeFormat,
    required this.sourceType,
    required this.createdAt,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            contentType.icon,
            color: colorScheme.onPrimaryContainer,
            size: 28,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contentType.label,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  _Badge(label: codeFormat, colorScheme: colorScheme),
                  const SizedBox(width: 6),
                  _Badge(label: sourceType, colorScheme: colorScheme),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _formatTimestamp(createdAt),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTimestamp(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year} '
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}';
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final ColorScheme colorScheme;

  const _Badge({required this.label, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  final String imagePath;
  final ColorScheme colorScheme;

  const _ImagePreview({
    required this.imagePath,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final file = File(imagePath);
    if (!file.existsSync()) return const SizedBox.shrink();

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 240, maxHeight: 240),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withAlpha(20),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Image.file(file, fit: BoxFit.contain),
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  final ParsedPayload parsed;
  final String rawValue;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _ContentCard({
    required this.parsed,
    required this.rawValue,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildContent(),
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    return switch (parsed) {
      UrlPayload(:final url) => [
          _field('URL', url),
        ],
      WifiPayload(
        :final ssid,
        :final password,
        :final encryptionType,
        :final hidden
      ) =>
        [
          _field('SSID', ssid),
          if (password != null && password.isNotEmpty)
            _field('Password', password),
          _field('Security', encryptionType),
          if (hidden) _field('Hidden', 'Yes'),
        ],
      ContactPayload(
        :final fullName,
        :final phone,
        :final email,
        :final organization,
        :final address,
        :final website,
        :final note,
      ) =>
        [
          if (fullName != null) _field('Name', fullName),
          if (organization != null) _field('Company', organization),
          if (phone != null) _field('Phone', phone),
          if (email != null) _field('Email', email),
          if (address != null) _field('Address', address),
          if (website != null) _field('Website', website),
          if (note != null) _field('Note', note),
        ],
      PhonePayload(:final number) => [
          _field('Phone', number),
        ],
      EmailPayload(:final address, :final subject, :final body) => [
          _field('Email', address),
          if (subject != null) _field('Subject', subject),
          if (body != null) _field('Body', body),
        ],
      SmsPayload(:final number, :final message) => [
          _field('Number', number),
          if (message != null) _field('Message', message),
        ],
      GeoPayload(:final latitude, :final longitude, :final label) => [
          if (label != null) _field('Label', label),
          _field('Latitude', latitude.toStringAsFixed(6)),
          _field('Longitude', longitude.toStringAsFixed(6)),
        ],
      CalendarPayload(
        :final summary,
        :final location,
        :final description,
        :final dtStart,
        :final dtEnd,
      ) =>
        [
          if (summary != null) _field('Event', summary),
          if (dtStart != null) _field('Start', _formatDate(dtStart)),
          if (dtEnd != null) _field('End', _formatDate(dtEnd)),
          if (location != null) _field('Location', location),
          if (description != null) _field('Description', description),
        ],
      ProductPayload(:final code) => [
          _field('Barcode', code),
        ],
      TextPayload(:final text) => [
          _field('Content', text),
        ],
    };
  }

  Widget _field(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: SelectableText(
              value,
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-'
        '${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}';
  }
}
