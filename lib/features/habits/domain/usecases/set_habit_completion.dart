import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/habit_repository.dart';

class SetHabitCompletionParams {
  const SetHabitCompletionParams({required this.habitId, required this.isDone});

  final String habitId;
  final bool isDone;
}

/// Marks a habit done/undone for today.
class SetHabitCompletion implements UseCase<Unit, SetHabitCompletionParams> {
  SetHabitCompletion(this._repository, this._now);

  final HabitRepository _repository;
  final DateTime Function() _now;

  @override
  Future<Either<Failure, Unit>> call(SetHabitCompletionParams params) =>
      _repository.setCompletion(
        habitId: params.habitId,
        day: _now(),
        isDone: params.isDone,
      );
}
