import 'package:dailyhabittracker/core/error/failure.dart';
import 'package:dailyhabittracker/core/usecase/usecase.dart';
import 'package:dailyhabittracker/features/habits/domain/entities/habit.dart';
import 'package:dailyhabittracker/features/habits/domain/repositories/habit_repository.dart';
import 'package:dailyhabittracker/features/habits/domain/usecases/add_habit.dart';
import 'package:dailyhabittracker/features/habits/domain/usecases/delete_habit.dart';
import 'package:dailyhabittracker/features/habits/domain/usecases/get_habit_detail.dart';
import 'package:dailyhabittracker/features/habits/domain/usecases/get_today_habits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRepo extends Mock implements HabitRepository {}

void main() {
  late MockRepo repo;
  final now = DateTime(2026, 10, 17, 9);
  final water = Habit(
    id: 'a',
    name: 'Water',
    description: '',
    points: 10,
    createdAt: now,
  );
  final read = Habit(
    id: 'b',
    name: 'Read',
    description: '',
    points: 20,
    createdAt: now,
  );

  setUp(() => repo = MockRepo());

  test('today summary totals points and completions', () async {
    when(() => repo.getHabits()).thenAnswer((_) async => Right([water, read]));
    when(() => repo.getCompletedHabitIds(any()))
        .thenAnswer((_) async => const Right({'b'}));

    final r = await GetTodayHabits(repo, () => now)(const NoParams());
    final s = r.getOrElse((_) => throw StateError('failed'));
    expect(s.earnedPoints, 20);
    expect(s.totalPoints, 30);
    expect(s.doneCount, 1);
  });

  test('detail streak counts back from yesterday when today is open', () async {
    when(() => repo.getHabit('a')).thenAnswer((_) async => Right(water));
    when(() => repo.getCompletions('a', any())).thenAnswer(
      (_) async => const Right([false, true, false, true, true, true, false]),
    );
    final d = (await GetHabitDetail(repo, () => now)('a'))
        .getOrElse((_) => throw StateError('failed'));
    expect(d.currentStreak, 3);
    expect(d.doneInLast7, 4);
    expect(d.isDoneToday, isFalse);
    expect(d.last7Days.last.date, DateTime(2026, 10, 17));
  });

  test('add habit rejects blank name and non-positive points', () async {
    final uc = AddHabit(repo);
    final a = await uc(
      const AddHabitParams(name: ' ', description: '', points: 5),
    );
    final b = await uc(
      const AddHabitParams(name: 'x', description: '', points: 0),
    );
    expect(a.isLeft(), isTrue);
    expect(b.isLeft(), isTrue);
    a.match((f) => expect(f, isA<ValidationFailure>()), (_) {});
    verifyNever(
      () => repo.addHabit(
        name: any(named: 'name'),
        description: any(named: 'description'),
        points: any(named: 'points'),
      ),
    );
  });

  test('delete habit rejects empty id and delegates otherwise', () async {
    when(() => repo.deleteHabit('a'))
        .thenAnswer((_) async => const Right(unit));
    final uc = DeleteHabit(repo);

    expect((await uc('')).isLeft(), isTrue);
    verifyNever(() => repo.deleteHabit(''));

    expect((await uc('a')).isRight(), isTrue);
    verify(() => repo.deleteHabit('a')).called(1);
  });
}
