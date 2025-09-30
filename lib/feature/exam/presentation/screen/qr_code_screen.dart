import 'dart:convert';
import 'dart:ui';

import 'package:emt7any/core/constants/assets_manager.dart';
import 'package:emt7any/core/extensions/navigation.dart';
import 'package:emt7any/core/ui/toast.dart';
import 'package:emt7any/feature/auth/cubit/student_cubit.dart';
import 'package:emt7any/feature/auth/cubit/student_state.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_cubit.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_state.dart';
import 'package:emt7any/feature/exam/presentation/screen/exam_screen.dart';
import 'package:emt7any/feature/exam/presentation/widgets/start_exam_options.dart';
import 'package:emt7any/feature/home/widgets/student_details_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrConfirmationScreen extends StatelessWidget {
  const QrConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        const SizedBox(width: 350, child: StudentDetailsDrawer()),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsManager.assetsImagesLogo),
              ),
            ),

            child: Container(
              color: Colors.black.withAlpha(400),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Column(
                      spacing: 40,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(blurRadius: 20, offset: Offset(0, 8)),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: BlocBuilder<StudentCubit, StudentState>(
                                builder: (context, state) => QrImageView(
                                  size: 300.0,
                                  eyeStyle: const QrEyeStyle(
                                    color: Color.fromRGBO(32, 56, 100, 1),
                                    eyeShape: QrEyeShape.square,
                                  ),
                                  dataModuleStyle: const QrDataModuleStyle(
                                    color: Color.fromRGBO(32, 56, 100, 1),

                                    dataModuleShape: QrDataModuleShape.square,
                                  ),
                                  data: jsonEncode(state.student!.toQRJson()),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 75,
                          child: BlocConsumer<ExamCubit, ExamState>(
                            listenWhen: (previous, current) =>
                                previous.loading != current.loading ||
                                previous.error != current.error ||
                                previous.isAthorized != current.isAthorized,
                            listener: (context, state) {
                              if (state.error.isNotEmpty) {
                                Toaster.error(state.error, isLong: true);
                              } else if (state.isAthorized) {
                                context.push(const ExamScreen());
                                return;
                              }
                            },
                            buildWhen: (previous, current) =>
                                previous.loading != current.loading,
                            builder: (context, state) => state.loading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : StartExamOptions(
                                    isDone: state.error.isNotEmpty,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                  const Text(
                    "برجاء الإنتظار حتى يتم مراجعة البيانات...",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
