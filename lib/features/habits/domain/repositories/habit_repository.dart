import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/habit.dart';

abstract class HabitRepository {
  Future<Either<Failure, List<Habit>>> getHabits();

  Future<Either<Failure, Habit>> getHabit(String habitId);

  Future<Either<Failure, Unit>> addHabit({
    required String name,
    required String description,
    required int points,
  });

  /// Ids of habits completed on [day] (date part only).
  Future<Either<Failure, Set<String>>> getCompletedHabitIds(DateTime day);

  /// Whether [habitId] was completed on each of [days], same order.
  Future<Either<Failure, List<bool>>> getCompletions(
    String habitId,
    List<DateTime> days,
  );

  Future<Either<Failure, Unit>> setCompletion({
    required String habitId,
    required DateTime day,
    required bool isDone,
  });
}
