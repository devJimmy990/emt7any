import 'package:emt7any/core/constants/assets_manager.dart';
import 'package:emt7any/core/style/text_style.dart';
import 'package:flutter/material.dart';

class StudentDetailsDrawer extends StatelessWidget {
  const StudentDetailsDrawer({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width * 0.3,
    decoration: const BoxDecoration(color: Color.fromRGBO(23, 57, 93, 1)),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: SingleChildScrollView(
      child: Column(
        spacing: 35,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 75,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    AssetsManager.assetsImagesUser,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "بيانات الطالب",
                  style: MyTextStyle.title.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(),
              const _StudentDetailsRichText(
                title: "الاسم",
                content: "محمد جمال احمد جاد",
              ),
              const _StudentDetailsRichText(
                title: "الرقم القومى",
                content: "29911040200519",
              ),
              const _StudentDetailsRichText(
                title: "الرقم الهاتف",
                content: "01289223643",
              ),
              const _StudentDetailsRichText(
                title: "البريد الالكترونى",
                content: "muhammedgamal997@gmail.com",
              ),
              const _StudentDetailsRichText(
                title: "اسم الحساب",
                content: "3201812203@alexu.edu.eg",
              ),
            ],
          ),
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "بيانات المدرسة",
                  style: MyTextStyle.title.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(),
              const _StudentDetailsRichText(
                title: "الاسم",
                content: "مدرسة محمد كريم الثانوية بنين",
              ),
              const _StudentDetailsRichText(
                title: "المديرية التعليمية",
                content: "الإسكندرية",
              ),
              const _StudentDetailsRichText(
                title: "الإدارة التعليمية",
                content: "إدارة شرق التعليمية",
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}

class _StudentDetailsRichText extends StatelessWidget {
  const _StudentDetailsRichText({required this.title, required this.content});
  final String title, content;

  @override
  Widget build(BuildContext context) => Column(
    textDirection: TextDirection.rtl,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$title: ",
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(content, style: const TextStyle(fontSize: 16, color: Colors.grey)),
    ],
  );
}
