import 'package:emt7any/core/constants/assets_manager.dart';
import 'package:emt7any/core/style/text_style.dart';
import 'package:emt7any/feature/auth/cubit/student_cubit.dart';
import 'package:emt7any/feature/auth/cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentDetailsDrawer extends StatelessWidget {
  const StudentDetailsDrawer({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<StudentCubit, StudentState>(
    builder: (context, state) => SizedBox(
      width: 320,
      child: Card(
        elevation: 15,
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
                  child: Column(
                    spacing: 20,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(500),
                          child: Image.asset(AssetsManager.assetsImagesUser),
                        ),
                      ),
                      Column(
                        spacing: 35,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "بيانات الطالب",
                                  style: MyTextStyle.title.copyWith(
                                    color: const Color.fromRGBO(0, 32, 96, 1),
                                  ),
                                ),
                              ),
                              Column(
                                spacing: 10,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _StudentDetailsRichText(
                                    title: "الاسم",
                                    content: state.student!.name,
                                  ),
                                  _StudentDetailsRichText(
                                    title: "الرقم القومى",
                                    content: state.student!.nationalId,
                                  ),
                                  _StudentDetailsRichText(
                                    title: "الرقم الهاتف",
                                    content: state.student!.phone,
                                  ),
                                  _StudentDetailsRichText(
                                    title: "البريد الالكترونى",
                                    content: state.student!.email,
                                    isEnglish: true,
                                  ),
                                  const _StudentDetailsRichText(
                                    title: "اسم الحساب",
                                    content: "3201812203@alexu.edu.eg",
                                    isEnglish: true,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "بيانات المدرسة",
                                  style: MyTextStyle.title.copyWith(
                                    color: const Color.fromRGBO(0, 32, 96, 1),
                                  ),
                                ),
                              ),
                              Column(
                                spacing: 10,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _StudentDetailsRichText(
                                    title: "الاسم",
                                    content: state.student!.school.name,
                                  ),
                                  _StudentDetailsRichText(
                                    title: "المديرية التعليمية",
                                    content: state.student!.school.governorate,
                                  ),
                                  _StudentDetailsRichText(
                                    title: "الإدارة التعليمية",
                                    content:
                                        state.student!.school.adminstration,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _StudentDetailsRichText extends StatelessWidget {
  const _StudentDetailsRichText({
    required this.title,
    required this.content,
    this.isEnglish = false,
  });
  final String title, content;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) => Column(
    textDirection: TextDirection.rtl,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$title: ",
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(32, 56, 100, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
      Directionality(
        textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(32, 56, 100, 1),
          ),
        ),
      ),
    ],
  );
}
