import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/today_habit.dart';
import '../repositories/habit_repository.dart';

class GetTodayHabits implements UseCase<TodaySummary, NoParams> {
  GetTodayHabits(this._repository, this._now);

  final HabitRepository _repository;
  final DateTime Function() _now;

  @override
  Future<Either<Failure, TodaySummary>> call(NoParams params) async {
    final habitsResult = await _repository.getHabits();
    final doneResult = await _repository.getCompletedHabitIds(_now());

    return habitsResult.flatMap(
      (habits) => doneResult.map((doneIds) {
        final items = [
          for (final h in habits)
            TodayHabit(habit: h, isDone: doneIds.contains(h.id)),
        ];
        return TodaySummary(
          habits: items,
          earnedPoints: items
              .where((i) => i.isDone)
              .fold(0, (sum, i) => sum + i.habit.points),
          totalPoints: items.fold(0, (sum, i) => sum + i.habit.points),
          doneCount: items.where((i) => i.isDone).length,
        );
      }),
    );
  }
}
