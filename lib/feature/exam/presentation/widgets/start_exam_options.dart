import 'dart:async';

import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/core/ui/button.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:flutter/material.dart';

class StartExamOptions extends StatefulWidget {
  const StartExamOptions({required this.isDone, super.key});
  final bool isDone;

  @override
  State<StartExamOptions> createState() => _StartExamOptionsState();
}

class _StartExamOptionsState extends State<StartExamOptions> {
  bool _disabled = false;
  int _secondsLeft = 0;
  Timer? _timer;

  void startCooldown(int seconds) {
    setState(() {
      _disabled = true;
      _secondsLeft = seconds;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 1) {
        timer.cancel();
        setState(() {
          _disabled = false;
          _secondsLeft = 0;
        });
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant StartExamOptions oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 👇 When error state comes (isDone == true), start cooldown
    if (widget.isDone && !oldWidget.isDone) {
      startCooldown(10);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
    widthFactor: .3,
    child: Button.filled(
      label: _disabled ? "انتظر $_secondsLeft ثانية" : "ابدا الامتحان ",
      onPressed: _disabled ? null : () => sl<ExamCubit>().getExam(),
      labelStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
