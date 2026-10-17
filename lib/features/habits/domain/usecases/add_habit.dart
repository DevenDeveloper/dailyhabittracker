import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/habit_repository.dart';

class AddHabitParams {
  const AddHabitParams({
    required this.name,
    required this.description,
    required this.points,
  });

  final String name;
  final String description;
  final int points;
}

class AddHabit implements UseCase<Unit, AddHabitParams> {
  AddHabit(this._repository);

  final HabitRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(AddHabitParams params) {
    final name = params.name.trim();
    if (name.isEmpty) {
      return Future.value(const Left(Failure.validation('Name is required')));
    }
    if (params.points <= 0) {
      return Future.value(
        const Left(Failure.validation('Points must be greater than 0')),
      );
    }
    return _repository.addHabit(
      name: name,
      description: params.description.trim(),
      points: params.points,
    );
  }
}
