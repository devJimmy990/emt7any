import 'package:emt7any/feature/tzlmat/screen/payment_screen.dart';
import 'package:flutter/material.dart';

// Screen 1: Subject Selection
class TzlmatScreen extends StatefulWidget {
  const TzlmatScreen({super.key});

  @override
  State<TzlmatScreen> createState() => _TzlmatScreenState();
}

class _TzlmatScreenState extends State<TzlmatScreen> {
  final List<String> subjects = [
    'الرياضيات - Mathematics',
    'الفيزياء - Physics',
    'الكيمياء - Chemistry',
    'الأحياء - Biology',
    'اللغة العربية - Arabic',
    'اللغة الإنجليزية - English',
    'التاريخ - History',
    'الجغرافيا - Geography',
  ];

  String? selectedSubject;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(31, 56, 100, 1),
            Color.fromRGBO(0, 32, 96, 1),
          ],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * .75,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.school,
                      size: 64,
                      color: Color.fromRGBO(32, 79, 160, 1),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'نظام التظلمات',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Grievance System',
                      style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'اختر المادة للتظلم',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Text('اختر المادة'),
                          value: selectedSubject,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: subjects
                              .map(
                                (subject) => DropdownMenuItem<String>(
                                  value: subject,
                                  child: Text(subject),
                                ),
                              )
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedSubject = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: selectedSubject == null
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentScreen(subject: selectedSubject!),
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF667eea),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'متابعة إلى الدفع - Continue to Payment',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// Screen 3: Video Player
