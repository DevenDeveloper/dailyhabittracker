import 'dart:math' as math;

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
    final progress = summary.totalPoints == 0
        ? 0.0
        : summary.earnedPoints / summary.totalPoints;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
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
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${summary.earnedPoints} / ${summary.totalPoints}',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
                Text(
                  'points',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${summary.doneCount} of $total completed',
                    style: const TextStyle(
                      color: Colors.white,
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
                      color: Colors.white,
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
      ..color = Colors.white.withValues(alpha: 0.2);
    canvas.drawArc(arcRect, 0, 2 * math.pi, false, track);

    if (progress <= 0) return;
    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..color = AppColors.accent;
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
    return Card(
      elevation: 0,
      color: item.isDone ? const Color(0xFFEAF8EF) : Colors.white,
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
