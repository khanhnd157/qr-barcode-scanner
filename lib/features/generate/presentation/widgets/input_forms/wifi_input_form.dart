import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/qr_generator_service.dart';

class WifiInputForm extends StatefulWidget {
  final ValueChanged<String> onPayloadChanged;

  const WifiInputForm({super.key, required this.onPayloadChanged});

  @override
  State<WifiInputForm> createState() => _WifiInputFormState();
}

class _WifiInputFormState extends State<WifiInputForm> {
  final _ssidController = TextEditingController();
  final _passwordController = TextEditingController();
  String _encryption = 'WPA';
  bool _hidden = false;
  bool _showPassword = false;

  @override
  void dispose() {
    _ssidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _update() {
    final ssid = _ssidController.text;
    if (ssid.isEmpty) {
      widget.onPayloadChanged('');
      return;
    }
    widget.onPayloadChanged(QrGeneratorService.buildWifi(
      ssid: ssid,
      password: _passwordController.text,
      encryption: _encryption,
      hidden: _hidden,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _ssidController,
          decoration: const InputDecoration(
            labelText: 'Network Name (SSID)',
            prefixIcon: Icon(Icons.wifi),
          ),
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _passwordController,
          obscureText: !_showPassword,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _showPassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () =>
                  setState(() => _showPassword = !_showPassword),
            ),
          ),
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          initialValue: _encryption,
          decoration: const InputDecoration(
            labelText: 'Security',
            prefixIcon: Icon(Icons.security),
          ),
          items: const [
            DropdownMenuItem(value: 'WPA', child: Text('WPA/WPA2')),
            DropdownMenuItem(value: 'WEP', child: Text('WEP')),
            DropdownMenuItem(value: 'nopass', child: Text('None')),
          ],
          onChanged: (value) {
            setState(() => _encryption = value ?? 'WPA');
            _update();
          },
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text('Hidden Network'),
          value: _hidden,
          contentPadding: EdgeInsets.zero,
          onChanged: (value) {
            setState(() => _hidden = value);
            _update();
          },
        ),
      ],
    );
  }
}
