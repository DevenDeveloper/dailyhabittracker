import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_today_habits.dart';
import '../../domain/usecases/set_habit_completion.dart';
import 'today_state.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit(this._getTodayHabits, this._setCompletion)
    : super(const TodayState.loading());

  final GetTodayHabits _getTodayHabits;
  final SetHabitCompletion _setCompletion;

  Future<void> load({bool silent = false}) async {
    if (!silent) emit(const TodayState.loading());
    final result = await _getTodayHabits(const NoParams());
    result.fold(
      (f) => emit(TodayState.error(f.message)),
      (summary) => emit(TodayState.loaded(summary)),
    );
  }

  Future<void> toggle(String habitId, bool isDone) async {
    final result = await _setCompletion(
      SetHabitCompletionParams(habitId: habitId, isDone: isDone),
    );
    result.fold(
      (f) => emit(TodayState.error(f.message)),
      (_) => load(silent: true),
    );
  }
}
