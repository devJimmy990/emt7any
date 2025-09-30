import 'package:emt7any/feature/exam/data/exam_section.dart';
import 'package:emt7any/feature/exam/data/exam_timing_info.dart';
import 'package:equatable/equatable.dart';

class Exam extends Equatable {
  const Exam({
    required this.id,
    required this.title,
    required this.description,
    required this.examType,
    required this.academicYear,
    required this.totalScore,
    required this.totalQuestions,
    required this.sections,
    required this.timingInfo,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    print("debug sections json: ${json['sections'].runtimeType}");
    print(
      "debug questions json: ${json['sections'][0]["questions"].runtimeType}",
    );
    print("debug timing_info json: ${json['timing_info'].runtimeType}");
    return Exam(
      id: json['id'] as int,
      title: json['title'] as String,
      examType: json['exam_type'] as String,
      totalScore: json['total_score'] as int,
      description: json['description'] as String,
      academicYear: json['academic_year'] as String,
      totalQuestions: json['total_questions'] as int,
      timingInfo: ExamTimingInfo.fromJson(
        json['timing_info'] as Map<String, dynamic>,
      ),
      sections: (json['sections'] as List)
          .cast<Map<String, dynamic>>()
          .map((e) => ExamSection.fromJson(e))
          .toList(),
    );
  }
  final ExamTimingInfo timingInfo;
  final List<ExamSection> sections;
  final int id, totalScore, totalQuestions;
  final String title, description, examType, academicYear;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'exam_type': examType,
    'total_score': totalScore,
    'description': description,
    'academic_year': academicYear,
    'total_questions': totalQuestions,
    'timing_info': timingInfo.toJson(),
    'sections': sections.map((e) => e.toJson()).toList(),
  };

  Exam copyWith({
    int? id,
    String? title,
    String? description,
    String? examType,
    String? academicYear,
    int? totalScore,
    int? totalQuestions,
    int? sectionsCount,
    List<ExamSection>? sections,
    ExamTimingInfo? timingInfo,
  }) => Exam(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    examType: examType ?? this.examType,
    academicYear: academicYear ?? this.academicYear,
    totalScore: totalScore ?? this.totalScore,
    totalQuestions: totalQuestions ?? this.totalQuestions,
    sections: sections ?? this.sections,
    timingInfo: timingInfo ?? this.timingInfo,
  );

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    examType,
    academicYear,
    totalScore,
    totalQuestions,
    sections,
    timingInfo,
  ];
}
