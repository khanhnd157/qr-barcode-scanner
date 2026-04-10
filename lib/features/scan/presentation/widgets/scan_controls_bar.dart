import 'package:flutter/material.dart';

class ScanControlsBar extends StatelessWidget {
  final bool flashOn;
  final bool bulkMode;
  final int bulkCount;
  final VoidCallback onFlashToggle;
  final VoidCallback onGalleryTap;

  const ScanControlsBar({
    super.key,
    required this.flashOn,
    required this.bulkMode,
    this.bulkCount = 0,
    required this.onFlashToggle,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ControlButton(
            icon: flashOn ? Icons.flash_on : Icons.flash_off,
            label: flashOn ? 'Flash On' : 'Flash Off',
            isActive: flashOn,
            onTap: onFlashToggle,
            colorScheme: colorScheme,
          ),
          if (bulkMode)
            _ControlButton(
              icon: Icons.burst_mode,
              label: bulkCount > 0 ? '$bulkCount scanned' : 'Bulk Mode',
              isActive: true,
              onTap: () {},
              colorScheme: colorScheme,
            ),
          _ControlButton(
            icon: Icons.photo_library_outlined,
            label: 'Gallery',
            isActive: false,
            onTap: onGalleryTap,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final ColorScheme colorScheme;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: isActive
                  ? colorScheme.primaryContainer
                  : Colors.white.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isActive
                  ? colorScheme.onPrimaryContainer
                  : Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
