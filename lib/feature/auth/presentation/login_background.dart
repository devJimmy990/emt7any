// import 'dart:ui';
// import 'package:flutter/material.dart';

// class LoginBackground extends StatelessWidget {
//   const LoginBackground({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Image.asset('assets/images/logo.png', fit: BoxFit.fitHeight),
//         BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//           child: Container(color: Colors.black.withAlpha(50)),
//         ),
//       ],
//     );
//   }
// }


import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fitHeight,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(color: Colors.black.withAlpha(50)),
        ),
        child,
      ],
    );
  }
}
