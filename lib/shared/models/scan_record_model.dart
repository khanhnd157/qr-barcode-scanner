import 'package:qr_scanner_generator/shared/enums/code_content.dart';
import 'package:qr_scanner_generator/shared/enums/code_format.dart';
import 'package:qr_scanner_generator/shared/enums/source_type.dart';

/// UI-facing model wrapping data from the database ScanRecord.
/// Used to pass scan results between screens before/after DB persistence.
class ScanRecordModel {
  final int? id;
  final String rawValue;
  final String? parsedTitle;
  final String? parsedSubtitle;
  final CodeContent contentType;
  final CodeFormat codeFormat;
  final SourceType sourceType;
  final bool isFavorite;
  final String? imagePath;
  final String? extraData;
  final DateTime createdAt;

  const ScanRecordModel({
    this.id,
    required this.rawValue,
    this.parsedTitle,
    this.parsedSubtitle,
    required this.contentType,
    required this.codeFormat,
    required this.sourceType,
    this.isFavorite = false,
    this.imagePath,
    this.extraData,
    required this.createdAt,
  });
}
