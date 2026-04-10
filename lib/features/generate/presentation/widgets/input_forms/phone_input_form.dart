import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/qr_generator_service.dart';

class PhoneInputForm extends StatefulWidget {
  final ValueChanged<String> onPayloadChanged;

  const PhoneInputForm({super.key, required this.onPayloadChanged});

  @override
  State<PhoneInputForm> createState() => _PhoneInputFormState();
}

class _PhoneInputFormState extends State<PhoneInputForm> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _update(String value) {
    if (value.isNotEmpty) {
      widget.onPayloadChanged(QrGeneratorService.buildPhone(value));
    } else {
      widget.onPayloadChanged('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        hintText: '+1234567890',
        prefixIcon: Icon(Icons.phone),
      ),
      onChanged: _update,
    );
  }
}
