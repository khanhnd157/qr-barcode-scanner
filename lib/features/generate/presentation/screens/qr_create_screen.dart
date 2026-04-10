import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scanner_generator/core/storage/image_storage_service.dart';
import 'package:qr_scanner_generator/core/utils/share_util.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/features/generate/application/generate_providers.dart';
import 'package:qr_scanner_generator/features/generate/domain/models/qr_content_type.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/input_forms/text_input_form.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/input_forms/url_input_form.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/input_forms/wifi_input_form.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/input_forms/contact_input_form.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/input_forms/email_input_form.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/input_forms/phone_input_form.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/input_forms/sms_input_form.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/input_forms/location_input_form.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/input_forms/event_input_form.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/preview/qr_preview_widget.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';
import 'package:qr_scanner_generator/shared/enums/code_format.dart';
import 'package:qr_scanner_generator/shared/enums/source_type.dart';
import 'package:qr_scanner_generator/shared/models/scan_record_model.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class QrCreateScreen extends ConsumerStatefulWidget {
  final QrContentType contentType;

  const QrCreateScreen({super.key, required this.contentType});

  @override
  ConsumerState<QrCreateScreen> createState() => _QrCreateScreenState();
}

class _QrCreateScreenState extends ConsumerState<QrCreateScreen> {
  final _repaintKey = GlobalKey();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    // Reset payload when entering screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(qrPayloadProvider.notifier).state = '';
    });
  }

  Future<void> _save() async {
    final payload = ref.read(qrPayloadProvider);
    if (payload.isEmpty) return;
    setState(() => _isSaving = true);

    try {
      // Capture image
      final storeImages = ref.read(settingsProvider).storeImages;
      final imagePath = await ImageExportService.captureAndSave(
        _repaintKey,
        fileName: 'qr_${widget.contentType.routeName}_${DateTime.now().millisecondsSinceEpoch}',
        storeImage: storeImages,
      );

      // Save to DB
      final parsed = ContentParser.parse(payload);
      final dao = ref.read(scanRecordDaoProvider);
      final recordId = await dao.insertRecord(
        ScanRecordsCompanion.insert(
          rawValue: payload,
          parsedTitle: Value(parsed.displayTitle),
          parsedSubtitle: Value(parsed.displaySubtitle),
          contentType: parsed.contentType,
          codeFormat: CodeFormat.qr,
          sourceType: SourceType.created,
          imagePath: Value(imagePath),
        ),
      );

      if (mounted) {
        final record = ScanRecordModel(
          id: recordId,
          rawValue: payload,
          parsedTitle: parsed.displayTitle,
          parsedSubtitle: parsed.displaySubtitle,
          contentType: parsed.contentType,
          codeFormat: CodeFormat.qr,
          sourceType: SourceType.created,
          imagePath: imagePath,
          createdAt: DateTime.now(),
        );
        context.push('/result/preview', extra: record);
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _share() async {
    final payload = ref.read(qrPayloadProvider);
    if (payload.isEmpty) return;

    final path = await ImageExportService.captureAndSave(
      _repaintKey,
      fileName: 'qr_share_${DateTime.now().millisecondsSinceEpoch}',
    );
    if (path != null) {
      await ShareUtil.shareFile(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final payload = ref.watch(qrPayloadProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create ${widget.contentType.label} QR'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input form
            _buildForm(),
            const SizedBox(height: 24),

            // QR Preview
            Center(
              child: QrPreviewWidget(
                data: payload,
                repaintKey: _repaintKey,
              ),
            ),
            const SizedBox(height: 24),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: payload.isEmpty || _isSaving ? null : _save,
                    icon: _isSaving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: payload.isEmpty ? null : _share,
                    icon: const Icon(Icons.share),
                    label: const Text('Share'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _onPayloadChanged(String value) {
    ref.read(qrPayloadProvider.notifier).state = value;
  }

  Widget _buildForm() {
    return switch (widget.contentType) {
      QrContentType.text || QrContentType.clipboard || QrContentType.app =>
        TextInputForm(
          onPayloadChanged: _onPayloadChanged,
          hintText: widget.contentType == QrContentType.app
              ? 'Enter package name or App Store ID'
              : widget.contentType == QrContentType.clipboard
                  ? 'Enter text from clipboard'
                  : 'Enter text',
        ),
      QrContentType.url => UrlInputForm(onPayloadChanged: _onPayloadChanged),
      QrContentType.wifi => WifiInputForm(onPayloadChanged: _onPayloadChanged),
      QrContentType.contact =>
        ContactInputForm(onPayloadChanged: _onPayloadChanged),
      QrContentType.email =>
        EmailInputForm(onPayloadChanged: _onPayloadChanged),
      QrContentType.phone =>
        PhoneInputForm(onPayloadChanged: _onPayloadChanged),
      QrContentType.sms => SmsInputForm(onPayloadChanged: _onPayloadChanged),
      QrContentType.location =>
        LocationInputForm(onPayloadChanged: _onPayloadChanged),
      QrContentType.event =>
        EventInputForm(onPayloadChanged: _onPayloadChanged),
    };
  }
}
