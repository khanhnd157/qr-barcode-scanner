import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_scanner_generator/features/scan/application/scan_providers.dart';
import 'package:qr_scanner_generator/features/scan/presentation/widgets/bulk_scan_sheet.dart';
import 'package:qr_scanner_generator/features/scan/presentation/widgets/scan_controls_bar.dart';
import 'package:qr_scanner_generator/features/scan/presentation/widgets/scan_overlay.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen>
    with WidgetsBindingObserver {
  MobileScannerController? _controller;
  bool _isProcessing = false;
  bool _cameraRunning = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  void _initCamera() {
    _controller = MobileScannerController(
      autoStart: true,
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
    _cameraRunning = true;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        _stopCamera();
      case AppLifecycleState.resumed:
        _startCameraIfOnTab();
      case AppLifecycleState.inactive:
        break;
    }
  }

  void _stopCamera() {
    if (_cameraRunning) {
      _cameraRunning = false;
      unawaited(_controller?.stop());
    }
  }

  void _startCameraIfOnTab() {
    final currentTab = ref.read(currentTabIndexProvider);
    if (currentTab == 0 && !_cameraRunning) {
      _cameraRunning = true;
      unawaited(_controller?.start());
    }
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_isProcessing) return;
    if (capture.barcodes.isEmpty) return;

    final barcode = capture.barcodes.first;
    if (barcode.rawValue == null || barcode.rawValue!.isEmpty) return;

    _isProcessing = true;

    try {
      final scanService = ref.read(scanServiceProvider);
      final record = await scanService.processScan(barcode);
      if (record == null || !mounted) return;

      final isBulk = ref.read(bulkScanModeProvider);
      if (isBulk) {
        // Accumulate in bulk sheet
        ref.read(bulkScanResultsProvider.notifier).add(record);
      } else {
        // Navigate to result
        context.push('/result/preview', extra: record);
      }
    } finally {
      Future.delayed(
        Duration(milliseconds: ref.read(bulkScanModeProvider) ? 500 : 1000),
        () {
          if (mounted) _isProcessing = false;
        },
      );
    }
  }

  Future<void> _onGalleryTap() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final controller = _controller;
    if (controller == null) return;

    final capture = await controller.analyzeImage(image.path);
    if (capture != null && capture.barcodes.isNotEmpty) {
      _onDetect(capture);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No QR code or barcode found in image'),
          ),
        );
      }
    }
  }

  void _onFlashToggle() {
    _controller?.toggleTorch();
    ref.read(flashStateProvider.notifier).state =
        !ref.read(flashStateProvider);
  }

  @override
  Widget build(BuildContext context) {
    final flashOn = ref.watch(flashStateProvider);
    final isBulk = ref.watch(bulkScanModeProvider);
    final bulkResults = ref.watch(bulkScanResultsProvider);

    // Pause camera when not on scan tab
    final currentTab = ref.watch(currentTabIndexProvider);
    if (currentTab != 0 && _cameraRunning) {
      _stopCamera();
    } else if (currentTab == 0 && !_cameraRunning) {
      _startCameraIfOnTab();
    }

    final controller = _controller;
    if (controller == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Camera preview
          MobileScanner(
            controller: controller,
            onDetect: _onDetect,
            errorBuilder: (context, error) {
              return _CameraErrorWidget(error: error);
            },
          ),

          // Scan overlay with animated viewfinder
          const ScanOverlay(),

          // Top bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Scan',
                      style:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    if (isBulk) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withAlpha(200),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'BULK',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          // Bottom: controls bar above bulk sheet
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScanControlsBar(
                    flashOn: flashOn,
                    bulkMode: isBulk,
                    bulkCount: bulkResults.length,
                    onFlashToggle: _onFlashToggle,
                    onGalleryTap: _onGalleryTap,
                  ),
                  if (isBulk) const BulkScanSheet(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Camera error / permission denied screen
// ---------------------------------------------------------------------------

class _CameraErrorWidget extends StatelessWidget {
  final MobileScannerException error;

  const _CameraErrorWidget({required this.error});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isPermission =
        error.errorCode == MobileScannerErrorCode.permissionDenied;

    return Container(
      color: colorScheme.surface,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isPermission ? Icons.no_photography : Icons.error_outline,
                size: 72,
                color: isPermission
                    ? colorScheme.primary
                    : colorScheme.error,
              ),
              const SizedBox(height: 20),
              Text(
                isPermission
                    ? 'Camera Permission Required'
                    : 'Camera Error',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                isPermission
                    ? 'This app needs camera access to scan QR codes and barcodes. '
                        'Please grant camera permission in your device settings.'
                    : 'Unable to start the camera. '
                        'Please try closing and reopening the app.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
              if (isPermission) ...[
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => openAppSettings(),
                  icon: const Icon(Icons.settings),
                  label: const Text('Open Settings'),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    // Try requesting permission again
                    Permission.camera.request();
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
