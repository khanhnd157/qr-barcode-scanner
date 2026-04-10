import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/core/database/app_database.dart';

class Bootstrap {
  static Future<AppDatabase> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = AppDatabase.defaults();
    return database;
  }
}
