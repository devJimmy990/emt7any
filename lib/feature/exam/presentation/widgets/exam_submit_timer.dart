import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ExamSubmitTimer extends StatefulWidget {
  const ExamSubmitTimer({required this.onSubmit, super.key});
  final void Function() onSubmit;

  @override
  State<ExamSubmitTimer> createState() => _ExamSubmitTimerState();
}

class _ExamSubmitTimerState extends State<ExamSubmitTimer> {
  int remaining = 0, initialSeconds = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remaining = initialSeconds = Random().nextInt(10) + 1;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remaining > 0) {
        setState(() => remaining--);
      } else {
        t.cancel();
        widget.onSubmit();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      const SizedBox(height: 12),
      Text(
        "سوف يتم تسليم الامتحان خلال: $remaining ثوانى",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      const SizedBox(height: 12),
    ],
  );
}
