import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_scanner_generator/features/history/application/history_providers.dart';

class HistorySearchBar extends ConsumerStatefulWidget {
  const HistorySearchBar({super.key});

  @override
  ConsumerState<HistorySearchBar> createState() => _HistorySearchBarState();
}

class _HistorySearchBarState extends ConsumerState<HistorySearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search history...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    ref.read(historySearchQueryProvider.notifier).state = '';
                    setState(() {});
                  },
                )
              : null,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        onChanged: (value) {
          ref.read(historySearchQueryProvider.notifier).state = value;
          setState(() {});
        },
      ),
    );
  }
}
