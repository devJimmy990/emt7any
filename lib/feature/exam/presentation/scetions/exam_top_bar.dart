import 'package:emt7any/core/extensions/navigation.dart';
import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/core/ui/button.dart';
import 'package:emt7any/core/ui/dialogs.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_state.dart';
import 'package:emt7any/feature/exam/cubit/side_bar_cubit.dart';
import 'package:emt7any/feature/exam/presentation/widgets/exam_submit_timer.dart';
import 'package:emt7any/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamTopBar extends StatelessWidget {
  const ExamTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<ExamCubit>();
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu, size: 30),
              onPressed: () => sl<SideBarCubit>().toggleSideBar(),
            ),
            Row(
              spacing: 20,
              children: [
                BlocBuilder<ExamCubit, ExamState>(
                  buildWhen: (previous, current) =>
                      previous.currentQuestionIndex !=
                          current.currentQuestionIndex ||
                      previous.currentSectionIndex !=
                          current.currentSectionIndex,
                  builder: (context, state) => Row(
                    spacing: 20,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: state.canGoBack
                            ? cubit.previousQuestion
                            : null,
                      ),
                      IconButton(
                        onPressed: state.canGoForward
                            ? cubit.nextQuestion
                            : null,
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    AppDialog.warning(
                      context: context,
                      title: "مسح إجابات الامتحان",
                      desc: "هل انت متأكد من رغبتك فى مسح الإجابات؟",
                      onOk: cubit.resetExam,
                      onCancel: () {},
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    "مسح الكل",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
                BlocBuilder<ExamCubit, ExamState>(
                  buildWhen: (prev, curr) => prev.isDone != curr.isDone,
                  builder: (context, state) => Button.filled(
                    label: "تسليم",
                    onPressed: (state.isHalfTime() && state.isDone)
                        ? () {
                            AppDialog.info(
                              context: context,
                              body: ExamSubmitTimer(
                                onSubmit: () async {
                                  cubit.submitExamAnswers();
                                  context.pushAndRemoveUntil(
                                    const HomeScreen(),
                                  );
                                },
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(120),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<ExamCubit, ExamState>(
                  buildWhen: (previous, current) =>
                      previous.examDuration != current.examDuration,
                  builder: (context, state) => Text(
                    state.formattedTime,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
