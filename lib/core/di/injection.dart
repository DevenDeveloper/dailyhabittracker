import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../../features/habits/data/datasources/habit_remote_data_source.dart';
import '../../features/habits/data/repositories/habit_repository_impl.dart';
import '../../features/habits/domain/repositories/habit_repository.dart';
import '../../features/habits/domain/usecases/add_habit.dart';
import '../../features/habits/domain/usecases/delete_habit.dart';
import '../../features/habits/domain/usecases/get_habit_detail.dart';
import '../../features/habits/domain/usecases/get_today_habits.dart';
import '../../features/habits/domain/usecases/set_habit_completion.dart';
import '../../features/habits/presentation/cubits/add_habit_cubit.dart';
import '../../features/habits/presentation/cubits/habit_detail_cubit.dart';
import '../../features/habits/presentation/cubits/today_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<HabitRemoteDataSource>(
      () => FirestoreHabitDataSource(getIt()),
    )
    ..registerLazySingleton<HabitRepository>(() => HabitRepositoryImpl(getIt()))
    ..registerLazySingleton<GetTodayHabits>(
      () => GetTodayHabits(getIt(), DateTime.now),
    )
    ..registerLazySingleton<GetHabitDetail>(
      () => GetHabitDetail(getIt(), DateTime.now),
    )
    ..registerLazySingleton<SetHabitCompletion>(
      () => SetHabitCompletion(getIt(), DateTime.now),
    )
    ..registerLazySingleton<AddHabit>(() => AddHabit(getIt()))
    ..registerLazySingleton<DeleteHabit>(() => DeleteHabit(getIt()))
    ..registerFactory<TodayCubit>(() => TodayCubit(getIt(), getIt(), getIt()))
    ..registerFactory<AddHabitCubit>(() => AddHabitCubit(getIt()))
    ..registerFactory<HabitDetailCubit>(
      () => HabitDetailCubit(getIt(), getIt(), getIt()),
    );
}
