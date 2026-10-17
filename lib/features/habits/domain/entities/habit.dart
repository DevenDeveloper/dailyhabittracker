import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit.freezed.dart';

@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String name,
    required String description,
    required int points,
    required DateTime createdAt,
  }) = _Habit;
}
