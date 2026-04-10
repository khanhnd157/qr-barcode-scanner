import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/qr_generator_service.dart';

class UrlInputForm extends StatefulWidget {
  final ValueChanged<String> onPayloadChanged;

  const UrlInputForm({super.key, required this.onPayloadChanged});

  @override
  State<UrlInputForm> createState() => _UrlInputFormState();
}

class _UrlInputFormState extends State<UrlInputForm> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _update(String value) {
    if (value.isNotEmpty) {
      widget.onPayloadChanged(QrGeneratorService.buildUrl(value));
    } else {
      widget.onPayloadChanged('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.url,
      decoration: const InputDecoration(
        labelText: 'URL',
        hintText: 'https://example.com',
        prefixIcon: Icon(Icons.language),
      ),
      onChanged: _update,
    );
  }
}
