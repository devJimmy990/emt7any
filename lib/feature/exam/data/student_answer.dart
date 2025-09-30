import 'package:equatable/equatable.dart';

class StudentAnswer extends Equatable {
  const StudentAnswer({required this.question, required this.answer});

  factory StudentAnswer.fromJson(Map<String, dynamic> json) => StudentAnswer(
    answer: json['answer'] as String,
    question: json['question'] as int,
  );

  Map<String, dynamic> toJson() => {'answer': answer, 'question': question};

  final String answer;
  final int question;

  @override
  List<Object?> get props => [question, answer];
}
