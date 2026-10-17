import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_habit_detail.dart';
import '../../domain/usecases/set_habit_completion.dart';
import 'habit_detail_state.dart';

class HabitDetailCubit extends Cubit<HabitDetailState> {
  HabitDetailCubit(this._getDetail, this._setCompletion)
    : super(const HabitDetailState.loading());

  final GetHabitDetail _getDetail;
  final SetHabitCompletion _setCompletion;

  Future<void> load(String habitId, {bool silent = false}) async {
    if (!silent) emit(const HabitDetailState.loading());
    final result = await _getDetail(habitId);
    result.fold(
      (f) => emit(HabitDetailState.error(f.message)),
      (d) => emit(HabitDetailState.loaded(d)),
    );
  }

  Future<void> toggleToday(String habitId, bool isDone) async {
    final result = await _setCompletion(
      SetHabitCompletionParams(habitId: habitId, isDone: isDone),
    );
    result.fold(
      (f) => emit(HabitDetailState.error(f.message)),
      (_) => load(habitId, silent: true),
    );
  }
}
