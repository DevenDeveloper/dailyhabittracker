import 'package:freezed_annotation/freezed_annotation.dart';

import 'habit.dart';

part 'today_habit.freezed.dart';

@freezed
abstract class TodayHabit with _$TodayHabit {
  const factory TodayHabit({required Habit habit, required bool isDone}) =
      _TodayHabit;
}

@freezed
abstract class TodaySummary with _$TodaySummary {
  const factory TodaySummary({
    required List<TodayHabit> habits,
    required int earnedPoints,
    required int totalPoints,
    required int doneCount,
  }) = _TodaySummary;
}
