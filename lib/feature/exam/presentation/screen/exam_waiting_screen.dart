import 'package:emt7any/feature/home/widgets/student_details_drawer.dart';
import 'package:flutter/material.dart';

class ExamWaitingScreen extends StatelessWidget {
  const ExamWaitingScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Row(children: [StudentDetailsDrawer()]));
}
