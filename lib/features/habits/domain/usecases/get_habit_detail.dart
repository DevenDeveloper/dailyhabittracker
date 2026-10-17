import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/habit_detail.dart';
import '../repositories/habit_repository.dart';

class GetHabitDetail implements UseCase<HabitDetail, String> {
  GetHabitDetail(this._repository, this._now);

  final HabitRepository _repository;
  final DateTime Function() _now;

  @override
  Future<Either<Failure, HabitDetail>> call(String habitId) async {
    final now = _now();
    final today = DateTime(now.year, now.month, now.day);
    final days = [
      for (var i = 6; i >= 0; i--)
        DateTime(today.year, today.month, today.day - i),
    ];

    final habitResult = await _repository.getHabit(habitId);
    final doneResult = await _repository.getCompletions(habitId, days);

    return habitResult.flatMap(
      (habit) => doneResult.map((done) {
        final statuses = [
          for (var i = 0; i < days.length; i++)
            DayStatus(date: days[i], isDone: done[i]),
        ];
        var streak = 0;
        // Today not done yet doesn't break a streak that ran up to yesterday.
        final counted = statuses.last.isDone
            ? statuses
            : statuses.sublist(0, statuses.length - 1);
        for (final s in counted.reversed) {
          if (!s.isDone) break;
          streak++;
        }
        return HabitDetail(
          habit: habit,
          last7Days: statuses,
          doneInLast7: statuses.where((s) => s.isDone).length,
          currentStreak: streak,
        );
      }),
    );
  }
}
