import 'package:emt7any/core/extensions/navigation.dart';
import 'package:emt7any/core/style/text_style.dart';
import 'package:emt7any/feature/qrcode/qr_code_page.dart';
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
        "action": () => context.push(const QrConfirmationPage()),
      },
      {"icon": Icons.report_problem, "label": "التظلمات", "action": null},
      {"icon": Icons.grade, "label": "النتائج الدراسية", "action": null},
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
  Widget build(BuildContext context) => Row(
    spacing: 24,
    mainAxisAlignment: MainAxisAlignment.center,
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
      width: 325,
      height: 325,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 12,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: const Color.fromRGBO(228, 162, 63, 1)),
            Text(
              label,
              style: MyTextStyle.subTitle.copyWith(
                fontSize: 30,
                color: const Color.fromRGBO(29, 67, 112, 1),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
