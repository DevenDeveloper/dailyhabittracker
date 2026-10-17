import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/today_habit.dart';
import '../cubits/today_cubit.dart';
import '../cubits/today_state.dart';
import '../widgets/animated_check.dart';
import '../widgets/fade_slide_in.dart';
import '../widgets/skeletons.dart';

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
        icon: const Icon(Symbols.add_rounded),
        label: const Text('Add habit'),
      ),
      body: BlocBuilder<TodayCubit, TodayState>(
        builder: (context, state) => switch (state) {
          TodayLoading() => const TodaySkeleton(),
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
                        itemBuilder: (context, i) => FadeSlideIn(
                          key: ValueKey(summary.habits[i].habit.id),
                          index: i,
                          child: _HabitTile(
                            item: summary.habits[i],
                            onOpen: () => _open(
                              context,
                              '/habit/${summary.habits[i].habit.id}',
                            ),
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
    final progress = summary.totalPoints == 0
        ? 0.0
        : summary.earnedPoints / summary.totalPoints;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.peach, AppColors.rose],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's progress",
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.ink.withValues(alpha: 0.75),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${summary.earnedPoints} / ${summary.totalPoints}',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
                Text(
                  'points',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.ink.withValues(alpha: 0.75),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cream.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${summary.doneCount} of $total completed',
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 120,
            height: 120,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              builder: (context, value, _) => CustomPaint(
                painter: _DonutPainter(value),
                child: Center(
                  child: Text(
                    '${(value * 100).round()}%',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  _DonutPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 14.0;
    final rect = Offset.zero & size;
    final arcRect = rect.deflate(stroke / 2);

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = AppColors.cream.withValues(alpha: 0.45);
    canvas.drawArc(arcRect, 0, 2 * math.pi, false, track);

    if (progress <= 0) return;
    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..color = AppColors.ink;
    canvas.drawArc(arcRect, -math.pi / 2, 2 * math.pi * progress, false, arc);
  }

  @override
  bool shouldRepaint(_DonutPainter old) => old.progress != progress;
}

class _HabitTile extends StatelessWidget {
  const _HabitTile({required this.item, required this.onOpen});

  final TodayHabit item;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: item.isDone ? AppColors.doneTint : AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: item.isDone
              ? AppColors.slate.withValues(alpha: 0.5)
              : Colors.transparent,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onOpen,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 14, 10),
            child: Row(
              children: [
                AnimatedCheck(
                  isDone: item.isDone,
                  onTap: () => context.read<TodayCubit>().toggle(
                    item.habit.id,
                    !item.isDone,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 250),
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: item.isDone
                              ? AppColors.textMuted
                              : AppColors.ink,
                          decoration: item.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                        child: Text(item.habit.name),
                      ),
                      if (item.habit.description.isNotEmpty)
                        Text(
                          item.habit.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textMuted,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.sand.withValues(
                      alpha: item.isDone ? 0.55 : 0.85,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Symbols.star_rounded,
                        fill: 1,
                        size: 16,
                        color: AppColors.rose,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${item.habit.points}',
                        style: const TextStyle(
                          color: AppColors.onAccent,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
