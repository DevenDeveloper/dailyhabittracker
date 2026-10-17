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
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
      children: [
        Text(
          habit.name,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        if (habit.description.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            habit.description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.star_rounded,
                color: AppColors.accent,
                value: '${habit.points}',
                label: 'Points',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.local_fire_department_rounded,
                color: const Color(0xFFF97316),
                value: '${detail.currentStreak}',
                label: 'Day streak',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.check_circle_rounded,
                color: AppColors.success,
                value: '${detail.doneInLast7}/7',
                label: 'This week',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last 7 days',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [for (final d in detail.last7Days) _DayDot(day: d)],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        detail.isDoneToday
            ? OutlinedButton.icon(
                onPressed: () => context.read<HabitDetailCubit>().toggleToday(
                  habit.id,
                  false,
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.undo_rounded),
                label: const Text('Mark today as not done'),
              )
            : FilledButton.icon(
                onPressed: () => context.read<HabitDetailCubit>().toggleToday(
                  habit.id,
                  true,
                ),
                icon: const Icon(Icons.check_rounded),
                label: const Text('Mark today as done'),
              ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color color;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
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
