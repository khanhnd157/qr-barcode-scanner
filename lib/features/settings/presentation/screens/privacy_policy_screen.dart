import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const _content = '''
Privacy Policy

Last updated: April 2026

1. Data Processing
This application processes all data locally on your device. No personal data, scan results, or generated codes are sent to any external server.

2. Camera Access
The camera is used solely for scanning QR codes and barcodes. Camera frames are processed in real-time and are not stored or transmitted. Images are only saved when you explicitly enable the "Store Images" setting.

3. Data Storage
All scan history, favorites, and generated codes are stored locally in a database on your device. You can delete this data at any time from the History screen or Settings.

4. Permissions
- Camera: Required for scanning codes
- Vibration: Used for haptic feedback on successful scan
- Storage: Used only when saving generated code images

5. Third-Party Services
This app does not use analytics, advertising, tracking, or any third-party data collection services.

6. Children's Privacy
This app does not knowingly collect any personal information from children.

7. Changes
We may update this privacy policy from time to time. Changes will be reflected in the app update notes.

8. Contact
For questions about this privacy policy, please contact us at:
privacy@izmaze.com
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(
          _content,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
              ),
        ),
      ),
    );
  }
}
