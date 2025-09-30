import 'package:emt7any/core/extensions/navigation.dart';
import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_state.dart';
import 'package:emt7any/feature/exam/cubit/side_bar_cubit.dart';
import 'package:emt7any/feature/exam/presentation/scetions/exam_progress_bar.dart';
import 'package:emt7any/feature/exam/presentation/scetions/exam_question_content.dart';
import 'package:emt7any/feature/exam/presentation/scetions/exam_side_bar.dart';
import 'package:emt7any/feature/exam/presentation/scetions/exam_top_bar.dart';
import 'package:emt7any/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  bool canStart = true;
  @override
  void initState() {
    super.initState();
    // _checkScreenRecording();
  }

  // Future<void> _checkScreenRecording() async {
  //   final isRecording = await ScreenRecorder.start();
  //   if (!mounted) return;

  //   if (isRecording) {
  //     setState(() => canStart = true);
  //   } else {
  //     AppDialog.warning(
  //       context: context,
  //       title: "تنبيه",
  //       desc: "يجب تفعيل تسجيل الشاشة لبدء الامتحان",
  //       onOk: () {
  //         _checkScreenRecording();
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: canStart
        ? BlocConsumer<ExamCubit, ExamState>(
            listenWhen: (previous, current) =>
                previous.isSubmitted != current.isSubmitted,
            listener: (context, state) {
              if (state.isSubmitted) {
                // Navigate to Home once exam is submitted
                context.pushAndRemoveUntil(const HomeScreen());
              }
            },
            buildWhen: (previous, current) =>
                previous.isAthorized != current.isAthorized,
            builder: (context, state) => BlocProvider(
              create: (context) => sl<SideBarCubit>(),
              child: const Row(
                children: [
                  ExamSidebar(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        spacing: 20,
                        children: [
                          ExamTopBar(),
                          ExamProgressBar(),
                          Expanded(child: ExamQuestionContent()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink(),
  );
}
