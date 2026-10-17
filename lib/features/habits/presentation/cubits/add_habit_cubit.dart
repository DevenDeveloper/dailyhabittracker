import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/add_habit.dart';
import 'add_habit_state.dart';

class AddHabitCubit extends Cubit<AddHabitState> {
  AddHabitCubit(this._addHabit) : super(const AddHabitState.initial());

  final AddHabit _addHabit;

  Future<void> submit({
    required String name,
    required String description,
    required int points,
  }) async {
    emit(const AddHabitState.submitting());
    final result = await _addHabit(
      AddHabitParams(name: name, description: description, points: points),
    );
    result.fold(
      (f) => emit(AddHabitState.error(f.message)),
      (_) => emit(const AddHabitState.success()),
    );
  }
}
