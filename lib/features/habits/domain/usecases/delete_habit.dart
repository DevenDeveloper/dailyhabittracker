import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/habit_repository.dart';

class DeleteHabit implements UseCase<Unit, String> {
  DeleteHabit(this._repository);

  final HabitRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(String habitId) {
    if (habitId.isEmpty) {
      return Future.value(
        const Left(Failure.validation('Habit id is required')),
      );
    }
    return _repository.deleteHabit(habitId);
  }
}
