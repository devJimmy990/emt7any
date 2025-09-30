import 'package:emt7any/feature/exam/data/exam_question.dart';
import 'package:equatable/equatable.dart';

class ExamSection extends Equatable {
  const ExamSection({
    required this.id,
    required this.name,
    required this.totalPoints,
    required this.questions,
    this.code,
  });

  factory ExamSection.fromJson(Map<String, dynamic> json) => ExamSection(
    id: json['id'] as int,
    code: json['code'] as String?,
    name: json['name'] as String,
    totalPoints: json['total_points'] as int,
    questions: (json['questions'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map((e) => Question.fromJson(e))
        .toList(),
  );
  final String? code;
  final String name;
  final int id, totalPoints;
  final List<Question> questions;

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'total_points': totalPoints,
    'questions': questions.map((e) => e.toJson()).toList(),
  };

  ExamSection copyWith({
    int? id,
    dynamic code,
    String? name,
    int? totalPoints,
    List<Question>? questions,
  }) => ExamSection(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    totalPoints: totalPoints ?? this.totalPoints,
    questions: questions ?? this.questions,
  );

  @override
  List<Object?> get props => [id, code, name, totalPoints, questions];
}
