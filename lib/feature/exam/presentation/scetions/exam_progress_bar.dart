import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamProgressBar extends StatelessWidget {
  const ExamProgressBar({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ExamCubit, ExamState>(
    builder: (context, state) {
      final answeredCount = state.answers.values.fold<int>(
        0,
        (sum, ans) => sum + ans.length,
      );

      final progress = answeredCount / state.exam!.totalQuestions;
      return Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              minHeight: 10,
              value: progress,
              color: Colors.green.shade700,
              backgroundColor: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "${(progress * 100).toStringAsFixed(0)}%",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      );
    },
  );
}
