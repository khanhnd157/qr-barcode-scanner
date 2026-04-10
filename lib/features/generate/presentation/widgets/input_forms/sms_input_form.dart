import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/qr_generator_service.dart';

class SmsInputForm extends StatefulWidget {
  final ValueChanged<String> onPayloadChanged;

  const SmsInputForm({super.key, required this.onPayloadChanged});

  @override
  State<SmsInputForm> createState() => _SmsInputFormState();
}

class _SmsInputFormState extends State<SmsInputForm> {
  final _numberController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _update() {
    final number = _numberController.text;
    if (number.isEmpty) {
      widget.onPayloadChanged('');
      return;
    }
    widget.onPayloadChanged(QrGeneratorService.buildSms(
      number: number,
      message: _messageController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _numberController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            labelText: 'Phone Number *',
            hintText: '+1234567890',
            prefixIcon: Icon(Icons.phone),
          ),
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _messageController,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Message',
            prefixIcon: Icon(Icons.message),
          ),
          onChanged: (_) => _update(),
        ),
      ],
    );
  }
}
