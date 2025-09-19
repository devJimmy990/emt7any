import 'package:emt7any/feature/auth/presentation/login_background.dart';
import 'package:emt7any/feature/exam/exam_page.dart';
import 'package:flutter/material.dart';
// import '../../../core/widgets/background_widget.dart';

class QrConfirmationPage extends StatelessWidget {
  const QrConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // النص
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'انتظر حتى يتم مراجعة بياناتك لتأكيد دخول الامتحان',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // صورة QR (دلوقتي static)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/qr_code.png', // صورة QR جاهزة
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ExamPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'ابدا الامتحان ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
