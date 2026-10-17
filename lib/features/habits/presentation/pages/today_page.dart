import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
      appBar: AppBar(
        toolbarHeight: 76,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('EEEE, d MMMM').format(DateTime.now()).toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 2),
            const Text("Today's Habits"),
          ],
        ),
      ),
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
                    ? const _EmptyState()
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
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF1DC), AppColors.card],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: AppColors.softShadow,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 230,
            height: 230,
            child: TweenAnimationBuilder<double>(
              key: ValueKey('${summary.doneCount}/$total'),
              tween: Tween(begin: 0, end: summary.doneCount.toDouble()),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              builder: (context, filled, _) => CustomPaint(
                painter: _SegmentedRingPainter(segments: total, filled: filled),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Symbols.local_fire_department_rounded,
                        fill: 1,
                        size: 44,
                        color: AppColors.peach,
                      ),
                      Text(
                        '${summary.doneCount}/$total',
                        style: theme.textTheme.displayMedium?.copyWith(
                          fontFamily: 'Georgia',
                          fontFamilyFallback: const ['serif'],
                          fontWeight: FontWeight.w700,
                          color: AppColors.ink,
                          height: 1.05,
                        ),
                      ),
                      Text(
                        'habits done',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.sand.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Symbols.star_rounded,
                  fill: 1,
                  size: 18,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  '${summary.earnedPoints} / ${summary.totalPoints} points',
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
    );
  }
}

/// One rounded segment per habit; [filled] segments (fractional while
/// animating) are drawn in the primary colour, clockwise from the top.
class _SegmentedRingPainter extends CustomPainter {
  _SegmentedRingPainter({required this.segments, required this.filled});

  final int segments;
  final double filled;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 18.0;
    final n = segments < 1 ? 7 : segments;
    final radius = (size.shortestSide - stroke) / 2;
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: radius,
    );

    final capAngle = (stroke / 2) / radius;
    final slot = 2 * math.pi / n;
    final gap = n == 1 ? 0.0 : 0.14;
    final sweep = math.max(0.02, slot - gap - 2 * capAngle);

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..color = AppColors.sand.withValues(alpha: 0.55);
    final done = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..color = AppColors.primary;

    for (var i = 0; i < n; i++) {
      final start = -math.pi / 2 + i * slot + gap / 2 + capAngle;
      canvas.drawArc(rect, start, sweep, false, track);
      final f = (filled - i).clamp(0.0, 1.0);
      if (f > 0) {
        canvas.drawArc(rect, start, math.max(0.001, sweep * f), false, done);
      }
    }
  }

  @override
  bool shouldRepaint(_SegmentedRingPainter old) =>
      old.segments != segments || old.filled != filled;
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
        boxShadow: item.isDone ? const [] : AppColors.softShadow,
        border: Border.all(
          color: item.isDone
              ? AppColors.primary.withValues(alpha: 0.3)
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

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.sand,
            ),
            child: const Icon(
              Symbols.eco_rounded,
              size: 48,
              fill: 1,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No habits yet',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Tap "Add habit" to start your first streak.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
