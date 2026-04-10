import 'package:flutter/material.dart';

class TextInputForm extends StatefulWidget {
  final ValueChanged<String> onPayloadChanged;
  final String hintText;

  const TextInputForm({
    super.key,
    required this.onPayloadChanged,
    this.hintText = 'Enter text',
  });

  @override
  State<TextInputForm> createState() => _TextInputFormState();
}

class _TextInputFormState extends State<TextInputForm> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: 4,
      decoration: InputDecoration(
        labelText: 'Text',
        hintText: widget.hintText,
      ),
      onChanged: widget.onPayloadChanged,
    );
  }
}
