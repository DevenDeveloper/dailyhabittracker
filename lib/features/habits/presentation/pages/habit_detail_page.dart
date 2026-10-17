import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/habit_detail.dart';
import '../cubits/habit_detail_cubit.dart';
import '../cubits/habit_detail_state.dart';

class HabitDetailPage extends StatelessWidget {
  const HabitDetailPage({super.key, required this.habitId});

  final String habitId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habit')),
      body: BlocBuilder<HabitDetailCubit, HabitDetailState>(
        builder: (context, state) => switch (state) {
          HabitDetailLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          HabitDetailError(:final message) => Center(child: Text(message)),
          HabitDetailLoaded(:final detail) => _Content(detail: detail),
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.detail});

  final HabitDetail detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final habit = detail.habit;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(habit.name, style: theme.textTheme.headlineMedium),
        const SizedBox(height: 8),
        if (habit.description.isNotEmpty) Text(habit.description),
        const SizedBox(height: 12),
        Chip(label: Text('${habit.points} points')),
        const SizedBox(height: 24),
        Text('Last 7 days', style: theme.textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(
          '${detail.doneInLast7}/7 done · current streak ${detail.currentStreak}',
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [for (final d in detail.last7Days) _DayDot(day: d)],
        ),
        const SizedBox(height: 32),
        FilledButton.icon(
          onPressed: () => context.read<HabitDetailCubit>().toggleToday(
            habit.id,
            !detail.isDoneToday,
          ),
          icon: Icon(detail.isDoneToday ? Icons.undo : Icons.check),
          label: Text(
            detail.isDoneToday
                ? 'Mark today as not done'
                : 'Mark today as done',
          ),
        ),
      ],
    );
  }
}

class _DayDot extends StatelessWidget {
  const _DayDot({required this.day});

  final DayStatus day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(DateFormat('E').format(day.date).substring(0, 1)),
        const SizedBox(height: 4),
        CircleAvatar(
          radius: 18,
          backgroundColor: day.isDone
              ? AppColors.success
              : const Color(0xFFE5E7EB),
          child: Icon(
            day.isDone ? Icons.check : Icons.close,
            size: 18,
            color: day.isDone ? Colors.white : AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          DateFormat('d').format(day.date),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
