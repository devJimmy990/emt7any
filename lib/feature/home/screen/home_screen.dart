import 'package:emt7any/core/constants/assets_manager.dart';
import 'package:emt7any/core/extensions/navigation.dart';
import 'package:emt7any/core/helper/service_locator.dart';
import 'package:emt7any/feature/auth/cubit/student_cubit.dart';
import 'package:emt7any/feature/auth/cubit/student_state.dart';
import 'package:emt7any/feature/auth/presentation/screen/login_screen.dart';
import 'package:emt7any/feature/home/widgets/home_options_list.dart';
import 'package:emt7any/feature/home/widgets/student_details_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOpened = false;
  bool isExpanding = false;

  @override
  Widget build(BuildContext context) =>
      BlocListener<StudentCubit, StudentState>(
        listener: (context, state) {
          if (state.student == null) {
            context.pushAndRemoveUntil(const LoginScreen());
          }
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(248, 252, 255, 1),
          floatingActionButton: FloatingActionButton(
            onPressed: () => sl<StudentCubit>().logout(),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromRGBO(0, 32, 96, 1),
            child: const RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.logout, size: 28),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                ColoredBox(
                  color: const Color.fromRGBO(23, 57, 93, 1),
                  child: SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isExpanding = true;
                                isOpened = !isOpened;
                              });
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                          Image.asset(
                            AssetsManager.assetsImagesLogo,
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        width: isOpened ? 350 : 0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(color: Colors.grey.shade200),
                          ),
                        ),
                        onEnd: () {
                          if (isExpanding) {
                            setState(() {
                              isExpanding = false; // stop shimmer
                            });
                          }
                        },
                        child: const StudentDetailsDrawer(),
                      ),
                      const Expanded(child: Center(child: HomeOptionsList())),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
