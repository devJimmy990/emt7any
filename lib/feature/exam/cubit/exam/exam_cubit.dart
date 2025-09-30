import 'dart:async';

import 'package:emt7any/feature/exam/cubit/controllers/exam_repository.dart';
import 'package:emt7any/feature/exam/cubit/exam/exam_state.dart';
import 'package:emt7any/feature/exam/data/student_answer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit(this._repository) : super(const ExamState());
  final ExamRepository _repository;
  Timer? _timer;

  Future<void> getExam() async {
    try {
      emit(state.copyWith(loading: true));
      final exam = await _repository.getExam();
      emit(
        state.copyWith(
          exam: exam,
          isAthorized: true,
          currentSection: 0,
          currentQuestion: 0,
          examDuration: const Duration(minutes: 1),
        ),
      );
      startTimer();
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> submitExamAnswers() async {
    try {
      stopTimer();
      emit(
        state.copyWith(
          loading: true,
          isReadyToSubmit: true,
          examDuration: Duration.zero,
        ),
      );

      final payload = {
        "answers": state.answers.values
            .expand((list) => list)
            .map(
              (a) => {
                "question_id": a.question,
                "answer": int.tryParse(a.answer) ?? a.answer,
              },
            )
            .toList(),
        "note": "test",
      };

      await _repository.submitAnswers(payload);

      emit(
        state.copyWith(
          isSubmitted: true,
          isAthorized: false,
          examDuration: Duration.zero,
          loading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  void startTimer() {
    stopTimer();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.examDuration > Duration.zero) {
        emit(
          state.copyWith(
            examDuration: state.examDuration - const Duration(seconds: 1),
          ),
        );
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  void selectAnswer(int answerIndex) {
    final sectionId = state.currentSection.id;
    final questionId = state.currentQuestion.id;

    // Copy answers map to avoid mutating directly
    final updatedAnswers = Map<int, List<StudentAnswer>>.from(state.answers);

    // Get existing answers for this section (or empty list)
    final sectionAnswers = List<StudentAnswer>.from(
      updatedAnswers[sectionId] ?? [],
    );

    final existingIndex = sectionAnswers.indexWhere(
      (a) => a.question == questionId,
    );

    if (existingIndex != -1) {
      // Replace old answer
      sectionAnswers[existingIndex] = StudentAnswer(
        answer: answerIndex.toString(),
        question: questionId,
      );
    } else {
      // Add new answer
      sectionAnswers.add(
        StudentAnswer(answer: answerIndex.toString(), question: questionId),
      );
    }

    updatedAnswers[sectionId] = sectionAnswers;

    print(
      "debug: updatedAnswers - ${_countAllAnswers(updatedAnswers)} == total - ${state.exam?.totalQuestions}",
    );
    emit(
      state.copyWith(
        answers: updatedAnswers,
        isDone: _countAllAnswers(updatedAnswers) == state.exam?.totalQuestions,
      ),
    );
  }

  void deleteAnswer() {
    final sectionId = state.currentSection.id;
    final questionId = state.currentQuestion.id;

    final updatedAnswers = Map<int, List<StudentAnswer>>.from(state.answers);

    if (updatedAnswers.containsKey(sectionId)) {
      final sectionAnswers = List<StudentAnswer>.from(
        updatedAnswers[sectionId]!,
      );

      sectionAnswers.removeWhere((a) => a.question == questionId);

      if (sectionAnswers.isEmpty) {
        updatedAnswers.remove(sectionId); // cleanup if empty
      } else {
        updatedAnswers[sectionId] = sectionAnswers;
      }
    }

    emit(
      state.copyWith(
        answers: updatedAnswers,
        isDone: _countAllAnswers(updatedAnswers) == state.exam?.totalQuestions,
      ),
    );
  }

  int _countAllAnswers(Map<int, List<StudentAnswer>> map) =>
      map.values.fold<int>(0, (sum, list) => sum + list.length);

  void goToQuestion({required int section, required int question}) {
    emit(state.copyWith(currentQuestion: question, currentSection: section));
  }

  void nextQuestion() {
    state.currentQuestionIndex != state.sectionQuestions.length - 1
        ? emit(state.copyWith(currentQuestion: state.currentQuestionIndex + 1))
        : emit(
            state.copyWith(
              currentSection: state.currentSectionIndex + 1,
              currentQuestion: 0,
            ),
          );
  }

  void previousQuestion() {
    if (state.currentQuestionIndex > 0) {
      emit(state.copyWith(currentQuestion: state.currentQuestionIndex - 1));
    } else {
      if (state.currentSectionIndex > 0) {
        final prevSectionIndex = state.currentSectionIndex - 1;
        final lastQuestionIndex =
            state.exam!.sections[prevSectionIndex].questions.length - 1;
        emit(
          state.copyWith(
            currentSection: prevSectionIndex,
            currentQuestion: lastQuestionIndex,
          ),
        );
      }
    }
  }

  void resetExam() {
    emit(
      state.copyWith(
        answers: {},
        isDone: false,
        currentSection: 0,
        currentQuestion: 0,
      ),
    );
  }

  void submitExam() {
    // final int firstUnansweredIndex = state.answers.indexWhere((a) => a == null);

    // if (firstUnansweredIndex != -1) {
    //   emit(
    //     state.copyWith(
    //       showUnansweredWarning: true,
    //       currentQuestion: firstUnansweredIndex,
    //     ),
    //   );
    // }
    //  else {
    emit(state.copyWith(isDone: true));
    // }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
