import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/features/generate/domain/generators/qr_generator_service.dart';

class EventInputForm extends StatefulWidget {
  final ValueChanged<String> onPayloadChanged;

  const EventInputForm({super.key, required this.onPayloadChanged});

  @override
  State<EventInputForm> createState() => _EventInputFormState();
}

class _EventInputFormState extends State<EventInputForm> {
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _update() {
    final title = _titleController.text;
    if (title.isEmpty) {
      widget.onPayloadChanged('');
      return;
    }
    widget.onPayloadChanged(QrGeneratorService.buildEvent(
      title: title,
      start: _startDate,
      end: _endDate,
      location: _locationController.text,
      description: _descriptionController.text,
    ));
  }

  Future<void> _pickDateTime({required bool isStart}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;

    final dateTime = DateTime(
      date.year, date.month, date.day, time.hour, time.minute,
    );

    setState(() {
      if (isStart) {
        _startDate = dateTime;
      } else {
        _endDate = dateTime;
      }
    });
    _update();
  }

  String _formatDateTime(DateTime? dt) {
    if (dt == null) return 'Not set';
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-'
        '${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Event Title *',
            prefixIcon: Icon(Icons.event),
          ),
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.access_time),
          title: const Text('Start'),
          subtitle: Text(_formatDateTime(_startDate)),
          onTap: () => _pickDateTime(isStart: true),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.access_time),
          title: const Text('End'),
          subtitle: Text(_formatDateTime(_endDate)),
          onTap: () => _pickDateTime(isStart: false),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _locationController,
          decoration: const InputDecoration(
            labelText: 'Location',
            prefixIcon: Icon(Icons.location_on),
          ),
          onChanged: (_) => _update(),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _descriptionController,
          maxLines: 2,
          decoration: const InputDecoration(
            labelText: 'Description',
            prefixIcon: Icon(Icons.description),
          ),
          onChanged: (_) => _update(),
        ),
      ],
    );
  }
}
