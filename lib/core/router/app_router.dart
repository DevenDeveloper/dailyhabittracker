import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/habits/presentation/cubits/add_habit_cubit.dart';
import '../../features/habits/presentation/cubits/habit_detail_cubit.dart';
import '../../features/habits/presentation/pages/add_habit_page.dart';
import '../../features/habits/presentation/pages/habit_detail_page.dart';
import '../../features/habits/presentation/pages/today_page.dart';
import '../di/injection.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, _) => const TodayPage(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (_, _) => BlocProvider(
            create: (_) => getIt<AddHabitCubit>(),
            child: const AddHabitPage(),
          ),
        ),
        GoRoute(
          path: 'habit/:id',
          builder: (_, state) {
            final id = state.pathParameters['id']!;
            return BlocProvider(
              create: (_) => getIt<HabitDetailCubit>()..load(id),
              child: HabitDetailPage(habitId: id),
            );
          },
        ),
      ],
    ),
  ],
);
