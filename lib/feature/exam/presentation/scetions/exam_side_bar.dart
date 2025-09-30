import 'package:emt7any/core/constants/assets_manager.dart';
import 'package:emt7any/feature/exam/cubit/side_bar_cubit.dart';
import 'package:emt7any/feature/exam/presentation/scetions/exam_side_bar_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamSidebar extends StatefulWidget {
  const ExamSidebar({super.key});

  @override
  State<ExamSidebar> createState() => _ExamSidebarState();
}

class _ExamSidebarState extends State<ExamSidebar> {
  bool isOpened = false;
  bool isExpanding = false;

  @override
  Widget build(BuildContext context) => BlocBuilder<SideBarCubit, bool>(
    builder: (context, sidebar) => AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: sidebar ? 280 : 0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(left: BorderSide(color: Colors.grey.shade200)),
      ),
      onEnd: () {
        sidebar
            ? setState(() {
                isOpened = true;
                isExpanding = false;
              })
            : setState(() => isOpened = false);
      },
      child: Builder(
        builder: (_) => !sidebar || !isOpened
            ? const SizedBox.shrink()
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            AssetsManager.assetsImagesLogo,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Expanded(child: ExamSideBarSections()),
                  ],
                ),
              ),
      ),
    ),
  );
}
