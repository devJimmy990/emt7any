import 'package:emt7any/feature/auth/model/student.dart';
import 'package:equatable/equatable.dart';

class StudentState extends Equatable {
  const StudentState({
    this.student,
    this.error = "",
    this.loading = false,
    this.isAuthenticated = false,
  });

  factory StudentState.fromJson(Map<String, dynamic> json) => StudentState(
    error: json['error'] ?? "",
    loading: json['loading'] ?? false,
    isAuthenticated: json['isAuthenticated'] ?? false,
    student: json['student'] != null ? Student.fromJson(json['student']) : null,
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "loading": loading,
    "isAuthenticated": isAuthenticated,
    "student": student?.toJson(),
  };

  StudentState copyWith({
    String? error,
    bool? loading,
    Student? student,
    bool? isAuthenticated,
  }) => StudentState(
    error: error ?? this.error,
    loading: loading ?? this.loading,
    student: student ?? this.student,
    isAuthenticated: isAuthenticated ?? this.isAuthenticated,
  );

  StudentState reset() => const StudentState();

  @override
  String toString() =>
      'StudentState(error: $error, loading: $loading, student: $student, isAuthenticated: $isAuthenticated)';

  @override
  List<Object?> get props => [student, error, loading, isAuthenticated];

  final String error;
  final bool loading;
  final Student? student;
  final bool isAuthenticated;
}
