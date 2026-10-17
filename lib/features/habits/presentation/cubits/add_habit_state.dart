import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_habit_state.freezed.dart';

@freezed
sealed class AddHabitState with _$AddHabitState {
  const factory AddHabitState.initial() = AddHabitInitial;
  const factory AddHabitState.submitting() = AddHabitSubmitting;
  const factory AddHabitState.success() = AddHabitSuccess;
  const factory AddHabitState.error(String message) = AddHabitError;
}
