import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/qr_generator_service.dart';

class ContactInputForm extends StatefulWidget {
  final ValueChanged<String> onPayloadChanged;

  const ContactInputForm({super.key, required this.onPayloadChanged});

  @override
  State<ContactInputForm> createState() => _ContactInputFormState();
}

class _ContactInputFormState extends State<ContactInputForm> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _orgController = TextEditingController();
  final _addressController = TextEditingController();
  final _websiteController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _orgController.dispose();
    _addressController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  void _update() {
    final name = _nameController.text;
    if (name.isEmpty) {
      widget.onPayloadChanged('');
      return;
    }
    widget.onPayloadChanged(QrGeneratorService.buildContact(
      name: name,
      phone: _phoneController.text,
      email: _emailController.text,
      organization: _orgController.text,
      address: _addressController.text,
      website: _websiteController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Full Name *',
            prefixIcon: Icon(Icons.person),
          ),
          textCapitalization: TextCapitalization.words,
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _orgController,
          decoration: const InputDecoration(
            labelText: 'Company',
            prefixIcon: Icon(Icons.business),
          ),
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _phoneController,
          decoration: const InputDecoration(
            labelText: 'Phone',
            prefixIcon: Icon(Icons.phone),
          ),
          keyboardType: TextInputType.phone,
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _addressController,
          decoration: const InputDecoration(
            labelText: 'Address',
            prefixIcon: Icon(Icons.location_on),
          ),
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _websiteController,
          decoration: const InputDecoration(
            labelText: 'Website',
            prefixIcon: Icon(Icons.language),
          ),
          keyboardType: TextInputType.url,
          onChanged: (_) => _update(),
        ),
      ],
    );
  }
}
