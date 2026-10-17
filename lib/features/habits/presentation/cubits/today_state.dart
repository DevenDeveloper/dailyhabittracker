import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/today_habit.dart';

part 'today_state.freezed.dart';

@freezed
sealed class TodayState with _$TodayState {
  const factory TodayState.loading() = TodayLoading;
  const factory TodayState.loaded(TodaySummary summary) = TodayLoaded;
  const factory TodayState.error(String message) = TodayError;
}
