import 'package:emt7any/core/constants/assets_manager.dart';
import 'package:emt7any/feature/home/widgets/home_options_list.dart';
import 'package:emt7any/feature/home/widgets/student_details_drawer.dart';
import 'package:emt7any/feature/home/widgets/welcome_message.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color.fromRGBO(232, 236, 237, 1),
    appBar: PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: ColoredBox(
        color: const Color.fromRGBO(23, 57, 93, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 40),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              Image.asset(AssetsManager.assetsImagesLogo),
            ],
          ),
        ),
      ),
    ),
    drawer: const StudentDetailsDrawer(),
    body: const SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 50),
              WelcomeMessage(
                text: "اهلا بك فى منصتك التعليمية...",
                pause: Duration(seconds: 2),
              ),
              Expanded(child: Center(child: HomeOptionsList())),
            ],
          ),
        ),
      ),
    ),
  );
}
