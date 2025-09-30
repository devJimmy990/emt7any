import 'package:equatable/equatable.dart';

class Question extends Equatable {
  const Question({
    required this.id,
    required this.points,
    required this.options,
    required this.helpText,
    required this.isRequired,
    required this.header,
    required this.questionType,
    required this.questionImage,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json['id'] as int,
    points: json['points'] as int,
    helpText: json['help_text'] as String?,
    isRequired: json['is_required'] ?? true,
    options: List<String>.from(json['options']),
    header: json['question_text'] as String,
    questionType: json['question_type'] as String,
    questionImage: json['question_image'] as String?,
  );

  final int id;
  final int points;
  final bool isRequired;
  final String header;
  final String questionType;
  final List<String> options;
  final String? helpText, questionImage;

  Map<String, dynamic> toJson() => {
    'id': id,
    'points': points,
    'options': options,
    'help_text': helpText,
    'is_required': isRequired,
    'question_text': header,
    'question_type': questionType,
    'question_image': questionImage,
  };

  Question copyWith({
    int? id,
    String? questionText,
    dynamic questionImage,
    String? questionType,
    List<String>? options,
    int? points,
    bool? isRequired,
    String? helpText,
  }) => Question(
    id: id ?? this.id,
    header: questionText ?? header,
    questionImage: questionImage ?? this.questionImage,
    questionType: questionType ?? this.questionType,
    options: options ?? this.options,
    points: points ?? this.points,
    isRequired: isRequired ?? this.isRequired,
    helpText: helpText ?? this.helpText,
  );

  @override
  List<Object?> get props => [
    id,
    header,
    questionImage,
    questionType,
    options,
    points,
    isRequired,
    helpText,
  ];
}
