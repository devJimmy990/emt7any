import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/core/ui/button.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamQuestionContent extends StatelessWidget {
  const ExamQuestionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<ExamCubit>();
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          BlocBuilder<ExamCubit, ExamState>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.currentSection.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  state.currentQuestion.header,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.currentQuestion.options.length,
                    itemBuilder: (context, optIndex) => Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 2,
                        ),
                      ),
                      child: RadioGroup<int>(
                        groupValue: state.selectedAnswer,
                        onChanged: (val) => cubit.selectAnswer(val!),
                        child: RadioListTile<int>(
                          value: optIndex,
                          activeColor: Colors.black,
                          title: Text(
                            state.currentQuestion.options[optIndex],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Button.icon(
              onPressed: cubit.deleteAnswer,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
