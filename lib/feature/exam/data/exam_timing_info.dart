import 'package:equatable/equatable.dart';

class ExamTimingInfo extends Equatable {
  const ExamTimingInfo({
    required this.startTime,
    required this.endTime,
    required this.durationMinutes,
    required this.timeRemainingMinutes,
  });

  factory ExamTimingInfo.fromJson(Map<String, dynamic> json) => ExamTimingInfo(
    durationMinutes: json['duration_minutes'] as int,
    endTime: DateTime.parse(json['end_time'] as String),
    startTime: DateTime.parse(json['start_time'] as String),
    timeRemainingMinutes: json['time_remaining_minutes'] as int,
  );
  final int durationMinutes;
  final int timeRemainingMinutes;
  final DateTime endTime, startTime;

  Map<String, dynamic> toJson() => {
    'duration_minutes': durationMinutes,
    'end_time': endTime.toIso8601String(),
    'start_time': startTime.toIso8601String(),
    'time_remaining_minutes': timeRemainingMinutes,
  };

  ExamTimingInfo copyWith({
    DateTime? startTime,
    DateTime? endTime,
    int? durationMinutes,
    int? timeRemainingMinutes,
  }) => ExamTimingInfo(
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    durationMinutes: durationMinutes ?? this.durationMinutes,
    timeRemainingMinutes: timeRemainingMinutes ?? this.timeRemainingMinutes,
  );

  @override
  List<Object?> get props => [
    startTime,
    endTime,
    durationMinutes,
    timeRemainingMinutes,
  ];
}
