import 'package:flutter/material.dart';
import 'login_background.dart';
import 'login_card.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: LoginCard(),
        ),
      ),
    );
  }
}
