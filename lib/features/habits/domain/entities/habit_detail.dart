import 'package:freezed_annotation/freezed_annotation.dart';

import 'habit.dart';

part 'habit_detail.freezed.dart';

@freezed
abstract class DayStatus with _$DayStatus {
  const factory DayStatus({required DateTime date, required bool isDone}) =
      _DayStatus;
}

@freezed
abstract class HabitDetail with _$HabitDetail {
  const factory HabitDetail({
    required Habit habit,

    /// Last 7 days, oldest first; the last item is today.
    required List<DayStatus> last7Days,
    required int doneInLast7,
    required int currentStreak,
  }) = _HabitDetail;

  const HabitDetail._();

  bool get isDoneToday => last7Days.last.isDone;
}
