import 'package:emt7any/feature/exam/data/exam.dart';
import 'package:emt7any/feature/exam/data/exam_question.dart';
import 'package:emt7any/feature/exam/data/exam_section.dart';
import 'package:emt7any/feature/exam/data/student_answer.dart';
import 'package:equatable/equatable.dart';

class ExamState extends Equatable {
  const ExamState({
    this.exam,
    bool? isDone,
    bool? loading,
    String? error,
    bool? isAthorized,
    bool? isSubmitted,
    bool? isReadyToSubmit,
    int? currentSection,
    int? currentQuestion,
    Duration? examDuration,
    bool? showUnansweredWarning,
    Map<int, List<StudentAnswer>>? answers,
  }) : error = error ?? '',
       isDone = isDone ?? false,
       loading = loading ?? false,
       isReadyToSubmit = isReadyToSubmit ?? false,
       answers = answers ?? const {},
       isSubmitted = isSubmitted ?? false,
       isAthorized = isAthorized ?? false,
       currentSectionIndex = currentSection ?? -1,
       currentQuestionIndex = currentQuestion ?? -1,
       examDuration = examDuration ?? Duration.zero;

  final Exam? exam;
  final String error;
  final Duration examDuration;
  final Map<int, List<StudentAnswer>> answers;
  final int currentQuestionIndex, currentSectionIndex;
  final bool isAthorized, loading, isDone, isSubmitted, isReadyToSubmit;

  ExamState copyWith({
    Exam? exam,
    bool? isDone,
    bool? loading,
    String? error,
    bool? isAthorized,
    bool? isSubmitted,
    bool? isReadyToSubmit,
    int? currentSection,
    int? currentQuestion,
    Duration? examDuration,
    Map<int, List<StudentAnswer>>? answers,
  }) => ExamState(
    exam: exam ?? this.exam,
    isDone: isDone ?? this.isDone,
    loading: loading,
    error: error, // ✅ fallback to current state
    isReadyToSubmit: isReadyToSubmit ?? this.isReadyToSubmit,
    isSubmitted: isSubmitted ?? this.isSubmitted,
    isAthorized: isAthorized ?? this.isAthorized,
    examDuration: examDuration ?? this.examDuration,
    currentSection: currentSection ?? currentSectionIndex,
    currentQuestion: currentQuestion ?? currentQuestionIndex,
    answers: answers ?? this.answers,
  );

  List<ExamSection> get sections => exam!.sections;
  ExamSection get currentSection => exam!.sections[currentSectionIndex];

  List<Question> get sectionQuestions => currentSection.questions;
  Question get currentQuestion =>
      currentSection.questions[currentQuestionIndex];

  int? get selectedAnswer {
    final sectionId = currentSection.id;
    final questionId = currentQuestion.id;

    final sectionAnswers = answers[sectionId];
    if (sectionAnswers == null) return null;

    final answerIndex = sectionAnswers.indexWhere(
      (a) => a.question == questionId,
    );

    if (answerIndex == -1) return null;

    return int.tryParse(sectionAnswers[answerIndex].answer);
  }

  bool isAnswered(int sectionId, int questionId) =>
      answers[sectionId]?.any((a) => a.question == questionId) ?? false;

  String get formattedTime {
    final d = examDuration;
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    if (hours > 0) {
      return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    }
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  bool isHalfTime() =>
      examDuration.inSeconds <= (exam!.timingInfo.durationMinutes / 2).floor();

  bool get isEnded => examDuration == Duration.zero;
  bool get canGoForward =>
      currentSectionIndex == exam!.sections.length - 1 &&
          currentQuestionIndex ==
              exam!.sections[currentSectionIndex].questions.length - 1
      ? false
      : true;

  bool get canGoBack =>
      currentQuestionIndex == 0 && currentSectionIndex == 0 ? false : true;

  @override
  List<Object?> get props => [
    exam,
    error,
    isDone,
    answers,
    loading,
    isAthorized,
    examDuration,
    currentSectionIndex,
    currentQuestionIndex,
  ];
}
