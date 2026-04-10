import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/qr_generator_service.dart';

class LocationInputForm extends StatefulWidget {
  final ValueChanged<String> onPayloadChanged;

  const LocationInputForm({super.key, required this.onPayloadChanged});

  @override
  State<LocationInputForm> createState() => _LocationInputFormState();
}

class _LocationInputFormState extends State<LocationInputForm> {
  final _latController = TextEditingController();
  final _lonController = TextEditingController();
  final _labelController = TextEditingController();

  @override
  void dispose() {
    _latController.dispose();
    _lonController.dispose();
    _labelController.dispose();
    super.dispose();
  }

  void _update() {
    final lat = double.tryParse(_latController.text);
    final lon = double.tryParse(_lonController.text);
    if (lat == null || lon == null) {
      widget.onPayloadChanged('');
      return;
    }
    widget.onPayloadChanged(QrGeneratorService.buildLocation(
      latitude: lat,
      longitude: lon,
      label: _labelController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _latController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: const InputDecoration(
                  labelText: 'Latitude *',
                  hintText: '10.762622',
                ),
                onChanged: (_) => _update(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: _lonController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: const InputDecoration(
                  labelText: 'Longitude *',
                  hintText: '106.660172',
                ),
                onChanged: (_) => _update(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _labelController,
          decoration: const InputDecoration(
            labelText: 'Label',
            hintText: 'e.g. My Office',
            prefixIcon: Icon(Icons.label),
          ),
          onChanged: (_) => _update(),
        ),
      ],
    );
  }
}
