import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ImageExportService {
  static const _storedDir = 'generated_codes';

  /// Captures a widget wrapped in RepaintBoundary to PNG bytes.
  static Future<Uint8List?> captureFromKey(GlobalKey key) async {
    final boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) return null;

    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  /// Returns the directory used for stored images.
  static Future<Directory> getStorageDir() async {
    final dir = await getApplicationDocumentsDirectory();
    final imagesDir = Directory(p.join(dir.path, _storedDir));
    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }
    return imagesDir;
  }

  /// Saves PNG bytes to app documents directory.
  /// Returns the saved file path.
  static Future<String> saveToDocuments(
    Uint8List bytes, {
    String? fileName,
  }) async {
    final imagesDir = await getStorageDir();
    final name = fileName ?? 'code_${DateTime.now().millisecondsSinceEpoch}';
    final filePath = p.join(imagesDir.path, '$name.png');
    final file = File(filePath);
    await file.writeAsBytes(bytes);
    return filePath;
  }

  /// Saves to documents and returns the path, or null on failure.
  /// When [storeImage] is false, captures to a temp file instead.
  static Future<String?> captureAndSave(
    GlobalKey key, {
    String? fileName,
    bool storeImage = true,
  }) async {
    final bytes = await captureFromKey(key);
    if (bytes == null) return null;

    if (storeImage) {
      return saveToDocuments(bytes, fileName: fileName);
    }

    // Save to temp directory (not persisted in stored images list)
    final tempDir = await Directory.systemTemp.createTemp('qr_export_');
    final name = fileName ?? 'code_${DateTime.now().millisecondsSinceEpoch}';
    final filePath = p.join(tempDir.path, '$name.png');
    await File(filePath).writeAsBytes(bytes);
    return filePath;
  }

  /// Lists all stored image files, sorted newest first.
  static Future<List<File>> listStoredImages() async {
    final imagesDir = await getStorageDir();
    final files = imagesDir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.png'))
        .toList();
    files.sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));
    return files;
  }

  /// Deletes a stored image file.
  static Future<void> deleteImage(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Deletes all stored images.
  static Future<void> deleteAllImages() async {
    final files = await listStoredImages();
    for (final file in files) {
      await file.delete();
    }
  }
}
