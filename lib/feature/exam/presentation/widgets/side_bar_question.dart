import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_state.dart';
import 'package:emt7any/feature/exam/data/exam_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarQuestion extends StatelessWidget {
  const SideBarQuestion({
    required this.question,
    required this.sectionId,
    required this.sectionIndex,
    required this.questionIndex,
    super.key,
  });

  final Question question;
  final int sectionId, sectionIndex, questionIndex;

  @override
  Widget build(BuildContext context) =>
      BlocSelector<ExamCubit, ExamState, bool>(
        selector: (state) => state.isAnswered(sectionId, question.id),
        builder: (context, isAnswered) => ListTile(
          title: Text(
            question.header,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isAnswered ? 14 : 18,
              fontWeight: isAnswered ? FontWeight.bold : FontWeight.normal,
              color: isAnswered ? Colors.green.shade800 : Colors.black,
            ),
          ),
          splashColor: Colors.transparent,
          style: ListTileStyle.drawer,
          leading: Icon(
            isAnswered ? Icons.check_circle_outline : Icons.help_outline,
            color: isAnswered ? Colors.green : Colors.grey,
          ),
          onTap: () {
            sl<ExamCubit>().goToQuestion(
              section: sectionIndex,
              question: questionIndex,
            );
          },
        ),
      );
}
