import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/habit.dart';
import '../../domain/repositories/habit_repository.dart';
import '../datasources/habit_remote_data_source.dart';
import '../models/habit_model.dart';

class HabitRepositoryImpl implements HabitRepository {
  HabitRepositoryImpl(this._dataSource);

  final HabitRemoteDataSource _dataSource;
  static final _keyFormat = DateFormat('yyyy-MM-dd');

  String _key(DateTime d) => _keyFormat.format(d);

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() body) async {
    try {
      return Right(await body());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Habit>>> getHabits() => _guard(() async {
    final models = await _dataSource.getHabits();
    return models.map((m) => m.toEntity()).toList();
  });

  @override
  Future<Either<Failure, Habit>> getHabit(String habitId) async {
    try {
      final model = await _dataSource.getHabit(habitId);
      if (model == null) return const Left(Failure.notFound('Habit not found'));
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addHabit({
    required String name,
    required String description,
    required int points,
  }) => _guard(() async {
    await _dataSource.addHabit(
      name: name,
      description: description,
      points: points,
    );
    return unit;
  });

  @override
  Future<Either<Failure, Unit>> deleteHabit(String habitId) => _guard(() async {
    await _dataSource.deleteHabit(habitId);
    return unit;
  });

  @override
  Future<Either<Failure, Set<String>>> getCompletedHabitIds(DateTime day) =>
      _guard(() => _dataSource.getCompletedHabitIds(_key(day)));

  @override
  Future<Either<Failure, List<bool>>> getCompletions(
    String habitId,
    List<DateTime> days,
  ) => _guard(
    () => _dataSource.getCompletions(habitId, days.map(_key).toList()),
  );

  @override
  Future<Either<Failure, Unit>> setCompletion({
    required String habitId,
    required DateTime day,
    required bool isDone,
  }) => _guard(() async {
    await _dataSource.setCompletion(
      habitId: habitId,
      dateKey: _key(day),
      isDone: isDone,
    );
    return unit;
  });
}
