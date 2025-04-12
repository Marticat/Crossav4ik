import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  bool _isRunning = false;
  final int _secondsRemaining = 60; // Added final keyword
// ... rest of the code

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      // Replace surfaceVariant with surfaceContainerHighest
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${(_secondsRemaining ~/ 60).toString().padLeft(2, '0')}:'
                '${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          IconButton(
            icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
            onPressed: _toggleTimer,

          ),
        ],
      ),
    );
  }

  void _toggleTimer() {
    setState(() {
      _isRunning = !_isRunning;
    });
    // Implement timer logic
  }
}
