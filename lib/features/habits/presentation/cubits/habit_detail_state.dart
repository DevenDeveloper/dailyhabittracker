import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/habit_detail.dart';

part 'habit_detail_state.freezed.dart';

@freezed
sealed class HabitDetailState with _$HabitDetailState {
  const factory HabitDetailState.loading() = HabitDetailLoading;
  const factory HabitDetailState.loaded(HabitDetail detail) = HabitDetailLoaded;
  const factory HabitDetailState.error(String message) = HabitDetailError;
}
