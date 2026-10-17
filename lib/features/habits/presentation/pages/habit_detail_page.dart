import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/habit_detail.dart';
import '../cubits/habit_detail_cubit.dart';
import '../cubits/habit_detail_state.dart';
import '../widgets/fade_slide_in.dart';
import '../widgets/skeletons.dart';

class HabitDetailPage extends StatelessWidget {
  const HabitDetailPage({super.key, required this.habitId});

  final String habitId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habit')),
      body: BlocBuilder<HabitDetailCubit, HabitDetailState>(
        builder: (context, state) => switch (state) {
          HabitDetailLoading() => const DetailSkeleton(),
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
        FadeSlideIn(
          index: 1,
          child: Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Symbols.star_rounded,
                  color: AppColors.peach,
                  value: '${habit.points}',
                  label: 'Points',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  icon: Symbols.local_fire_department_rounded,
                  color: AppColors.rose,
                  value: '${detail.currentStreak}',
                  label: 'Day streak',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  icon: Symbols.check_circle_rounded,
                  color: AppColors.success,
                  value: '${detail.doneInLast7}/7',
                  label: 'This week',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(24),
            boxShadow: AppColors.softShadow,
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
                children: [
                  for (final (i, d) in detail.last7Days.indexed)
                    _DayDot(
                      day: d,
                      index: i,
                      isToday: i == detail.last7Days.length - 1,
                    ),
                ],
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
                icon: const Icon(Symbols.undo_rounded),
                label: const Text('Mark today as not done'),
              )
            : FilledButton.icon(
                onPressed: () => context.read<HabitDetailCubit>().toggleToday(
                  habit.id,
                  true,
                ),
                icon: const Icon(Symbols.check_rounded),
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
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        boxShadow: AppColors.softShadow,
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30, fill: 1),
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
  const _DayDot({
    required this.day,
    required this.index,
    required this.isToday,
  });

  final DayStatus day;
  final int index;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          DateFormat('E').format(day.date).substring(0, 1),
          style: theme.textTheme.labelMedium?.copyWith(
            color: AppColors.textMuted,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        TweenAnimationBuilder<double>(
          key: ValueKey('${day.date}-${day.isDone}'),
          tween: Tween(begin: 0, end: 1),
          duration: Duration(milliseconds: 350 + index * 90),
          curve: Curves.elasticOut,
          builder: (context, t, child) =>
              Transform.scale(scale: t.clamp(0.0, 1.3), child: child),
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: day.isDone ? AppColors.success : AppColors.cream,
              border: isToday
                  ? Border.all(color: AppColors.peach, width: 3)
                  : null,
            ),
            child: Icon(
              day.isDone ? Symbols.check_rounded : Symbols.remove_rounded,
              size: 18,
              color: day.isDone ? Colors.white : const Color(0xFFC9B48E),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          isToday ? 'Today' : DateFormat('d').format(day.date),
          style: theme.textTheme.bodySmall?.copyWith(
            color: isToday ? AppColors.primary : AppColors.textMuted,
            fontWeight: isToday ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
