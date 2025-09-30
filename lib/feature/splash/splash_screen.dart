import 'package:emt7any/core/constants/assets_manager.dart';
import 'package:emt7any/feature/splash/welcome_message.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _spinController;

  late Animation<double> _spinAnimation;

  @override
  void initState() {
    super.initState();

    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _spinAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _spinController, curve: Curves.easeInOut),
    );

    Future.delayed(
      const Duration(milliseconds: 1500),
      () => _spinController.forward(),
    );
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        const ColoredBox(
          color: Color.fromRGBO(23, 57, 93, 1),
          child: SizedBox(height: 150, width: double.infinity),
        ),
        Expanded(
          child: Center(
            child: SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  const Spacer(),
                  RotationTransition(
                    turns: _spinAnimation,
                    child: Image.asset(
                      AssetsManager.assetsImagesLogo,
                      height: 120,
                    ),
                  ),

                  const VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: Color.fromRGBO(23, 57, 93, 1),
                  ),
                  const Expanded(
                    child: WelcomeMessage(
                      text: "اهلا بك فى منصتك التعليمية...",
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
