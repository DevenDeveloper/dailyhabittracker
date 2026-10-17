import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/today_habit.dart';
import '../cubits/today_cubit.dart';
import '../cubits/today_state.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TodayCubit>()..load(),
      child: const _TodayView(),
    );
  }
}

class _TodayView extends StatelessWidget {
  const _TodayView();

  Future<void> _open(BuildContext context, String location) async {
    final cubit = context.read<TodayCubit>();
    await context.push(location);
    cubit.load(silent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Today's Habits")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _open(context, '/add'),
        icon: const Icon(Icons.add),
        label: const Text('Add habit'),
      ),
      body: BlocBuilder<TodayCubit, TodayState>(
        builder: (context, state) => switch (state) {
          TodayLoading() => const Center(child: CircularProgressIndicator()),
          TodayError(:final message) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message, textAlign: TextAlign.center),
                TextButton(
                  onPressed: () => context.read<TodayCubit>().load(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          TodayLoaded(:final summary) => Column(
            children: [
              _ProgressHeader(summary: summary),
              Expanded(
                child: summary.habits.isEmpty
                    ? const Center(child: Text('No habits yet. Add one!'))
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 88),
                        itemCount: summary.habits.length,
                        itemBuilder: (context, i) => _HabitTile(
                          item: summary.habits[i],
                          onOpen: () => _open(
                            context,
                            '/habit/${summary.habits[i].habit.id}',
                          ),
                        ),
                      ),
              ),
            ],
          ),
        },
      ),
    );
  }
}

class _ProgressHeader extends StatelessWidget {
  const _ProgressHeader({required this.summary});

  final TodaySummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = summary.habits.length;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${summary.earnedPoints} / ${summary.totalPoints} points',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${summary.doneCount} of $total habits completed',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              minHeight: 8,
              backgroundColor: Colors.white24,
              color: AppColors.accent,
              value: summary.totalPoints == 0
                  ? 0
                  : summary.earnedPoints / summary.totalPoints,
            ),
          ),
        ],
      ),
    );
  }
}

class _HabitTile extends StatelessWidget {
  const _HabitTile({required this.item, required this.onOpen});

  final TodayHabit item;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        onTap: onOpen,
        leading: IconButton(
          tooltip: item.isDone ? 'Mark not done' : 'Mark done',
          icon: Icon(
            item.isDone ? Icons.check_circle : Icons.check_box_outline_blank,
            color: item.isDone ? AppColors.success : AppColors.textMuted,
          ),
          onPressed: () =>
              context.read<TodayCubit>().toggle(item.habit.id, !item.isDone),
        ),
        title: Text(
          item.habit.name,
          style: item.isDone
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        subtitle: item.habit.description.isEmpty
            ? null
            : Text(
                item.habit.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
        trailing: Chip(
          avatar: const Icon(
            Icons.star_rounded,
            size: 16,
            color: AppColors.accent,
          ),
          label: Text('${item.habit.points}'),
        ),
      ),
    );
  }
}
