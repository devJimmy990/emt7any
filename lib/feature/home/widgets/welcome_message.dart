import 'dart:async';

import 'package:flutter/material.dart';

class WelcomeMessage extends StatefulWidget {
  const WelcomeMessage({
    required this.text,
    super.key,
    this.duration = const Duration(milliseconds: 100),
    this.pause = const Duration(milliseconds: 800),
  });

  final String text;
  final Duration duration;
  final Duration pause;

  @override
  State<WelcomeMessage> createState() => _WelcomeMessageState();
}

class _WelcomeMessageState extends State<WelcomeMessage> {
  String _displayedText = "";
  int _currentIndex = 0;
  bool _isDeleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        if (!_isDeleting) {
          // Typing
          if (_currentIndex < widget.text.length) {
            _displayedText += widget.text[_currentIndex];
            _currentIndex++;
          } else {
            // Pause before deleting
            _isDeleting = true;
            _timer?.cancel();
            Future.delayed(widget.pause, _startAnimation);
          }
        } else {
          // Deleting (stop at 1 instead of 0)
          if (_currentIndex > 1) {
            _currentIndex--;
            _displayedText = widget.text.substring(0, _currentIndex);
          } else {
            // Pause before typing again
            _isDeleting = false;
            _timer?.cancel();
            Future.delayed(widget.pause, _startAnimation);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Text(
    _displayedText,
    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
  );
}
