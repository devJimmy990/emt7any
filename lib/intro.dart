import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/feature/auth/cubit/student_cubit.dart';
import 'package:emt7any/feature/auth/presentation/screen/login_screen.dart';
import 'package:emt7any/feature/home/screen/home_screen.dart';
import 'package:emt7any/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  bool canStart = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 7000), () {
      setState(() {
        canStart = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) => !canStart
      ? const SplashScreen()
      : sl<StudentCubit>().state.isAuthenticated
      ? const HomeScreen()
      : const LoginScreen();
}
