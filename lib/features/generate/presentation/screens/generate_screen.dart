import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_scanner_generator/features/generate/presentation/screens/qr_type_list_screen.dart';
import 'package:qr_scanner_generator/features/generate/presentation/screens/barcode_type_list_screen.dart';

class GenerateScreen extends ConsumerWidget {
  const GenerateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Generate'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'QR Code'),
              Tab(text: 'Barcode'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            QrTypeListScreen(),
            BarcodeTypeListScreen(),
          ],
        ),
      ),
    );
  }
}
