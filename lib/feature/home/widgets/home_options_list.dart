import 'package:emt7any/core/extensions/navigation.dart';
import 'package:emt7any/core/style/text_style.dart';
import 'package:emt7any/feature/exam/presentation/screen/qr_code_screen.dart';
import 'package:emt7any/feature/scores/scores_screen.dart';
import 'package:emt7any/feature/tzlmat/screen/tzlmat_screen.dart';
import 'package:flutter/material.dart';

class HomeOptionsList extends StatefulWidget {
  const HomeOptionsList({super.key});

  @override
  State<HomeOptionsList> createState() => _HomeOptionsListState();
}

class _HomeOptionsListState extends State<HomeOptionsList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;

  late List<Map<String, dynamic>> _cards;

  @override
  void initState() {
    _cards = [
      {
        "icon": Icons.assignment,
        "label": "الامتحانات",
        "action": () => context.push(const QrConfirmationScreen()),
      },
      {
        "icon": Icons.report_problem,
        "label": "التظلمات",
        "action": () => context.push(const TzlmatScreen()),
      },
      {
        "icon": Icons.grade,
        "label": "النتائج الدراسية",
        "action": () => context.push(const FinalScoresScreen()),
      },
    ];
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimations = List.generate(_cards.length, (index) {
      final start = index * 0.2;
      final end = start + 0.5;
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    _fadeAnimations = List.generate(_cards.length, (index) {
      final start = index * 0.2;
      final end = start + 0.5;
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeIn),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 24,
    runSpacing: 24,
    alignment: WrapAlignment.center,
    runAlignment: WrapAlignment.center,
    children: List.generate(_cards.length, (i) {
      final card = _cards[i];
      return SlideTransition(
        position: _slideAnimations[i],
        child: FadeTransition(
          opacity: _fadeAnimations[i],
          child: _HomeCard(
            icon: card["icon"] as IconData,
            label: card["label"] as String,
            onTap: card["action"] ?? () {},
          ),
        ),
      );
    }),
  );
}

// --- ويدجت الكروت السريعة
class _HomeCard extends StatelessWidget {
  const _HomeCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: SizedBox(
      width: 375,
      height: 275,
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        elevation: 12,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: const Color.fromRGBO(228, 162, 63, 1)),
            Text(
              label,
              style: MyTextStyle.subTitle.copyWith(
                fontSize: 36,
                color: const Color.fromRGBO(29, 67, 112, 1),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
