import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scanner_generator/core/storage/image_storage_service.dart';
import 'package:qr_scanner_generator/core/utils/share_util.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/features/generate/application/generate_providers.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/barcode_generator_service.dart';
import 'package:qr_scanner_generator/features/generate/domain/models/barcode_format_type.dart';
import 'package:qr_scanner_generator/features/generate/presentation/widgets/preview/barcode_preview_widget.dart';
import 'package:qr_scanner_generator/features/settings/application/settings_providers.dart';
import 'package:qr_scanner_generator/shared/enums/code_format.dart';
import 'package:qr_scanner_generator/shared/enums/source_type.dart';
import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/models/scan_record_model.dart';

class BarcodeCreateScreen extends ConsumerStatefulWidget {
  final BarcodeFormatType format;

  const BarcodeCreateScreen({super.key, required this.format});

  @override
  ConsumerState<BarcodeCreateScreen> createState() =>
      _BarcodeCreateScreenState();
}

class _BarcodeCreateScreenState extends ConsumerState<BarcodeCreateScreen> {
  final _repaintKey = GlobalKey();
  final _controller = TextEditingController();
  String? _validationError;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(barcodeDataProvider.notifier).state = '';
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    final validator = BarcodeGeneratorService.getValidator(
      widget.format.routeName,
    );
    setState(() => _validationError = value.isEmpty ? null : validator(value));
    ref.read(barcodeDataProvider.notifier).state =
        _validationError == null ? value : '';
  }

  CodeFormat _mapFormat() {
    return switch (widget.format) {
      BarcodeFormatType.ean13 => CodeFormat.ean13,
      BarcodeFormatType.ean8 => CodeFormat.ean8,
      BarcodeFormatType.upcA => CodeFormat.upcA,
      BarcodeFormatType.code39 => CodeFormat.code39,
      BarcodeFormatType.code128 => CodeFormat.code128,
      BarcodeFormatType.itf => CodeFormat.itf,
      BarcodeFormatType.codabar => CodeFormat.codabar,
    };
  }

  Future<void> _save() async {
    final data = ref.read(barcodeDataProvider);
    if (data.isEmpty) return;
    setState(() => _isSaving = true);

    try {
      final storeImages = ref.read(settingsProvider).storeImages;
      final imagePath = await ImageExportService.captureAndSave(
        _repaintKey,
        fileName:
            'barcode_${widget.format.routeName}_${DateTime.now().millisecondsSinceEpoch}',
        storeImage: storeImages,
      );

      final dao = ref.read(scanRecordDaoProvider);
      final parsed = ProductPayload(code: data);
      final recordId = await dao.insertRecord(
        ScanRecordsCompanion.insert(
          rawValue: data,
          parsedTitle: Value(parsed.displayTitle),
          parsedSubtitle: Value('${widget.format.label} barcode'),
          contentType: parsed.contentType,
          codeFormat: _mapFormat(),
          sourceType: SourceType.created,
          imagePath: Value(imagePath),
        ),
      );

      if (mounted) {
        final record = ScanRecordModel(
          id: recordId,
          rawValue: data,
          parsedTitle: parsed.displayTitle,
          parsedSubtitle: '${widget.format.label} barcode',
          contentType: parsed.contentType,
          codeFormat: _mapFormat(),
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
    final data = ref.read(barcodeDataProvider);
    if (data.isEmpty) return;

    final path = await ImageExportService.captureAndSave(
      _repaintKey,
      fileName: 'barcode_share_${DateTime.now().millisecondsSinceEpoch}',
    );
    if (path != null) {
      await ShareUtil.shareFile(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(barcodeDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create ${widget.format.label}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Barcode Data',
                hintText: _hintForFormat(),
                prefixIcon: const Icon(Icons.barcode_reader),
                errorText: _validationError,
              ),
              onChanged: _onChanged,
            ),
            const SizedBox(height: 24),

            // Barcode preview
            Center(
              child: BarcodePreviewWidget(
                data: data,
                format: widget.format,
                repaintKey: _repaintKey,
              ),
            ),
            const SizedBox(height: 24),

            // Actions
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: data.isEmpty || _isSaving ? null : _save,
                    icon: _isSaving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child:
                                CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: data.isEmpty ? null : _share,
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

  String _hintForFormat() {
    return switch (widget.format) {
      BarcodeFormatType.ean13 => '5901234123457',
      BarcodeFormatType.ean8 => '96385074',
      BarcodeFormatType.upcA => '012345678905',
      BarcodeFormatType.code39 => 'HELLO-123',
      BarcodeFormatType.code128 => 'Hello World',
      BarcodeFormatType.itf => '1234567890',
      BarcodeFormatType.codabar => 'A12345B',
    };
  }
}
