import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/qr_generator_service.dart';

class EmailInputForm extends StatefulWidget {
  final ValueChanged<String> onPayloadChanged;

  const EmailInputForm({super.key, required this.onPayloadChanged});

  @override
  State<EmailInputForm> createState() => _EmailInputFormState();
}

class _EmailInputFormState extends State<EmailInputForm> {
  final _addressController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  void _update() {
    final address = _addressController.text;
    if (address.isEmpty) {
      widget.onPayloadChanged('');
      return;
    }
    widget.onPayloadChanged(QrGeneratorService.buildEmail(
      address: address,
      subject: _subjectController.text,
      body: _bodyController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _addressController,
          decoration: const InputDecoration(
            labelText: 'Email Address *',
            prefixIcon: Icon(Icons.alternate_email),
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _subjectController,
          decoration: const InputDecoration(
            labelText: 'Subject',
            prefixIcon: Icon(Icons.subject),
          ),
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _bodyController,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Body',
            prefixIcon: Icon(Icons.message),
          ),
          onChanged: (_) => _update(),
        ),
      ],
    );
  }
}
