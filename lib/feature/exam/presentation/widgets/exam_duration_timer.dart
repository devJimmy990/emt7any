import 'dart:async';

import 'package:emt7any/feature/exam/presentation/widgets/exam_submit_timer.dart';
import 'package:flutter/material.dart';

class ExamDurationTimer extends StatefulWidget {
  const ExamDurationTimer(this.examDuration, {super.key});
  final int examDuration;

  @override
  State<ExamDurationTimer> createState() => _ExamDurationTimerState();
}

class _ExamDurationTimerState extends State<ExamDurationTimer> {
  Timer? _timer;
  late Duration _remaining;

  @override
  void initState() {
    super.initState();
    _remaining = Duration(minutes: widget.examDuration);

    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (_remaining.inMinutes > 0) {
        setState(() {
          _remaining -= const Duration(minutes: 1);
        });
      } else {
        timer.cancel();
        ExamSubmitTimer(onSubmit: () {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final hours = _remaining.inHours;
    final minutes = _remaining.inMinutes.remainder(60);
    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) => Text(
    _formattedTime,
    style: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );
}
