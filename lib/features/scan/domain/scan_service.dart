import 'package:drift/drift.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';
import 'package:qr_scanner_generator/core/database/daos/scan_record_dao.dart';
import 'package:qr_scanner_generator/core/utils/clipboard_util.dart';
import 'package:qr_scanner_generator/core/utils/haptic_util.dart';
import 'package:qr_scanner_generator/features/scan/domain/format_mapper.dart';
import 'package:qr_scanner_generator/features/settings/domain/settings_model.dart';
import 'package:qr_scanner_generator/shared/enums/source_type.dart';
import 'package:qr_scanner_generator/shared/models/parsed_payload.dart';
import 'package:qr_scanner_generator/shared/models/scan_record_model.dart';
import 'package:qr_scanner_generator/shared/parsers/content_parser.dart';

class ScanService {
  final ScanRecordDao _dao;
  final AppSettings _settings;
  final HapticUtil _haptic;

  ScanService({
    required ScanRecordDao dao,
    required AppSettings settings,
    required HapticUtil haptic,
  })  : _dao = dao,
        _settings = settings,
        _haptic = haptic;

  Future<ScanRecordModel?> processScan(Barcode barcode) async {
    final rawValue = barcode.rawValue;
    if (rawValue == null || rawValue.isEmpty) return null;

    // Duplicate suppression
    final isDuplicate = await _dao.isDuplicate(rawValue);
    if (isDuplicate) return null;

    // Parse content
    final parsed = ContentParser.parse(rawValue);
    final codeFormat = FormatMapper.fromMobileScanner(barcode.format);

    // Feedback
    if (_settings.vibrateEnabled) {
      _haptic.vibrate();
    }
    if (_settings.beepEnabled) {
      _haptic.beep();
    }

    // Auto-copy
    if (_settings.autoCopyClipboard) {
      ClipboardUtil.copy(rawValue);
    }

    // Save to history
    int? recordId;
    if (_settings.saveHistory) {
      recordId = await _dao.insertRecord(
        ScanRecordsCompanion.insert(
          rawValue: rawValue,
          parsedTitle: Value(parsed.displayTitle),
          parsedSubtitle: Value(parsed.displaySubtitle),
          contentType: parsed.contentType,
          codeFormat: codeFormat,
          sourceType: SourceType.scanned,
        ),
      );
    }

    return ScanRecordModel(
      id: recordId,
      rawValue: rawValue,
      parsedTitle: parsed.displayTitle,
      parsedSubtitle: parsed.displaySubtitle,
      contentType: parsed.contentType,
      codeFormat: codeFormat,
      sourceType: SourceType.scanned,
      createdAt: DateTime.now(),
    );
  }

  ParsedPayload parseRawValue(String rawValue) {
    return ContentParser.parse(rawValue);
  }
}
