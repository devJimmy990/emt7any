import 'package:emt7any/feature/auth/presentation/login_background.dart';
import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int currentQuestion = 0;
  Duration elapsedTime = Duration.zero;
  late final Stopwatch _stopwatch;
  late final Ticker _ticker;

  final List<Question> questions = [
    Question(text: "ما هو ناتج 2 + 2 ؟", options: ["1", "2", "3", "4"]),
    Question(
      text: "عاصمة مصر هي ؟",
      options: ["القاهرة", "الإسكندرية", "أسوان", "الأقصر"],
    ),
    Question(
      text: "لغة تطوير Flutter هي ؟",
      options: ["Kotlin", "Swift", "Dart", "Java"],
    ),
  ];

  late final List<int?> answers;

  @override
  void initState() {
    super.initState();
    answers = List<int?>.filled(questions.length, null);

    _stopwatch = Stopwatch()..start();
    _ticker = Ticker((elapsed) {
      setState(() {
        elapsedTime = elapsed;
      });
    })..start();
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      body: BackgroundWidget(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade50, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                // ✅ جزء أرقام الأسئلة
                Container(
                  width: 110,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(240),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withAlpha(40),
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: questions.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemBuilder: (context, index) {
                      final answered = answers[index] != null;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentQuestion = index;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: answered
                              ? Colors.green.withAlpha(180)
                              : Colors.green.withAlpha(60),
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ✅ جزء السؤال
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // ✅ progress bar
                        LinearProgressIndicator(
                          value: (currentQuestion + 1) / questions.length,
                          backgroundColor: Colors.green.withAlpha(40),
                          color: Colors.green.shade400,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        const SizedBox(height: 20),

                        Expanded(
                          child: Card(
                            elevation: 4,
                            color: Colors.white.withAlpha(240),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "سؤال ${currentQuestion + 1}/${questions.length}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade700,
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  Text(
                                    question.text,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // ✅ الاختيارات
                                  Expanded(
                                    child: ListView(
                                      children: List.generate(
                                        question.options.length,
                                        (index) {
                                          final selected =
                                              answers[currentQuestion] == index;
                                          return Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: selected
                                                  ? Colors.green.withAlpha(120)
                                                  : Colors.green.withAlpha(25),
                                              border: Border.all(
                                                color: selected
                                                    ? Colors.green.shade600
                                                    : Colors.grey.shade300,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: RadioListTile<int>(
                                              value: index,
                                              groupValue:
                                                  answers[currentQuestion],
                                              onChanged: (val) {
                                                setState(() {
                                                  answers[currentQuestion] =
                                                      val;
                                                });
                                              },
                                              activeColor:
                                                  Colors.green.shade700,
                                              title: Text(
                                                question.options[index],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: selected
                                                      ? Colors.white
                                                      : Colors.black87,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ✅ أزرار التنقل
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: currentQuestion > 0
                                  ? () {
                                      setState(() {
                                        currentQuestion--;
                                      });
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade400,
                                disabledBackgroundColor: Colors.grey.shade300
                                    .withAlpha(150),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text("⬅️ السابق"),
                            ),
                            ElevatedButton(
                              onPressed: currentQuestion < questions.length - 1
                                  ? () {
                                      setState(() {
                                        currentQuestion++;
                                      });
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade400,
                                disabledBackgroundColor: Colors.grey.shade300
                                    .withAlpha(150),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text("التالي ➡️"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: const Text("إنهاء الامتحان"),
                                  content: const Text(
                                    "هل أنت متأكد أنك تريد إنهاء الامتحان؟",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("إلغاء"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red.shade400,
                                      ),
                                      child: const Text("تأكيد"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.withAlpha(200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text("إنهاء الامتحان"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ✅ Model للأسئلة
class Question {
  final String text;
  final List<String> options;

  Question({required this.text, required this.options});
}

/// ✅ Helper Ticker
class Ticker {
  final void Function(Duration) onTick;
  late final Stopwatch _stopwatch;
  late final Duration _tickInterval;
  bool _running = false;

  Ticker(this.onTick, {Duration tickInterval = const Duration(seconds: 1)}) {
    _stopwatch = Stopwatch();
    _tickInterval = tickInterval;
  }

  void start() {
    _running = true;
    _stopwatch.start();
    _tick();
  }

  void _tick() async {
    while (_running) {
      await Future.delayed(_tickInterval);
      onTick(_stopwatch.elapsed);
    }
  }

  void dispose() {
    _running = false;
    _stopwatch.stop();
  }
}
