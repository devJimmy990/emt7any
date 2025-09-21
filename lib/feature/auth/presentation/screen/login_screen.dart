import 'package:emt7any/core/constants/assets_manager.dart';
import 'package:emt7any/core/extensions/size.dart';
import 'package:emt7any/feature/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(1, 1, 1, .25),
        image: DecorationImage(
          image: AssetImage(AssetsManager.assetsImagesLogo),
        ),
      ),
      child: Center(
        child: SizedBox(
          width: context.width * .5,
          child: Card(
            elevation: 10,
            color: Colors.white.withAlpha(150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.all(24),
              child: LoginForm(),
            ),
          ),
        ),
      ),
    ),
  );
}
