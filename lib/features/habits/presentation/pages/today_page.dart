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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _open(context, '/add'),
        icon: const Icon(Symbols.add_rounded),
        label: const Text('Add habit'),
      ),
      body: SafeArea(
        child: BlocBuilder<TodayCubit, TodayState>(
          builder: (context, state) => switch (state) {
            TodayLoading() => const Column(
              children: [
                _TitleBlock(),
                Expanded(child: TodaySkeleton()),
              ],
            ),
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
            TodayLoaded(:final summary) => RefreshIndicator(
              onRefresh: () => context.read<TodayCubit>().load(silent: true),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 96),
                children: [
                  const _TitleBlock(),
                  _ProgressHeader(summary: summary),
                  if (summary.habits.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 48),
                      child: _EmptyState(),
                    ),
                  for (final (i, item) in summary.habits.indexed)
                    FadeSlideIn(
                      key: ValueKey(item.habit.id),
                      index: i,
                      child: _HabitTile(
                        item: item,
                        onOpen: () => _open(context, '/habit/${item.habit.id}'),
                      ),
                    ),
                ],
              ),
            ),
          },
        ),
      ),
    );
  }
}

class _TitleBlock extends StatelessWidget {
  const _TitleBlock();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Column(
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
          Text(
            "Today's Habits",
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800, color: AppColors.ink),
          ),
        ],
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
    final serif = theme.textTheme.headlineSmall?.copyWith(
      fontFamily: 'Georgia',
      fontFamilyFallback: const ['serif'],
      fontWeight: FontWeight.w700,
      color: AppColors.ink,
    );
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE3F6F2), AppColors.card],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppColors.softShadow,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 112,
            height: 112,
            child: TweenAnimationBuilder<double>(
              key: ValueKey('${summary.doneCount}/$total'),
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              builder: (context, t, _) => CustomPaint(
                painter: _SegmentedRingPainter(
                  segments: total,
                  filled: summary.doneCount * t,
                  pointsProgress: summary.totalPoints == 0
                      ? 0
                      : summary.earnedPoints / summary.totalPoints * t,
                ),
                child: const Center(
                  child: Icon(
                    Symbols.local_fire_department_rounded,
                    fill: 1,
                    size: 30,
                    color: AppColors.accent,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TODAY'S PROGRESS",
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.textMuted,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text('${summary.doneCount} of $total done', style: serif),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accentSoft.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Symbols.star_rounded,
                        fill: 1,
                        size: 16,
                        color: AppColors.primaryDark,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${summary.earnedPoints} / ${summary.totalPoints} pts',
                        style: const TextStyle(
                          color: AppColors.onAccent,
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                      ),
                    ],
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

/// Outer ring: one rounded segment per habit (filled ones glow in the
/// primary gradient). Inner thin ring: share of today's points earned.
class _SegmentedRingPainter extends CustomPainter {
  _SegmentedRingPainter({
    required this.segments,
    required this.filled,
    required this.pointsProgress,
  });

  final int segments;
  final double filled;
  final double pointsProgress;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.shortestSide * 0.1;
    final innerStroke = stroke * 0.4;
    final center = size.center(Offset.zero);
    final n = segments < 1 ? 7 : segments;
    final radius = (size.shortestSide - stroke) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final capAngle = (stroke / 2) / radius;
    final slot = 2 * math.pi / n;
    final gap = n == 1 ? 0.0 : 0.14;
    final sweep = math.max(0.02, slot - gap - 2 * capAngle);

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..color = AppColors.track;
    final done = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..shader = const SweepGradient(
        startAngle: 0,
        endAngle: 2 * math.pi,
        colors: [AppColors.primary, AppColors.primaryDark, AppColors.primary],
        transform: GradientRotation(-math.pi / 2),
      ).createShader(rect);
    final glow = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..color = AppColors.primary.withValues(alpha: 0.45)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, stroke * 0.45);

    for (var i = 0; i < n; i++) {
      final start = -math.pi / 2 + i * slot + gap / 2 + capAngle;
      canvas.drawArc(rect, start, sweep, false, track);
      final f = (filled - i).clamp(0.0, 1.0);
      if (f > 0) {
        final arcSweep = math.max(0.001, sweep * f);
        canvas.drawArc(rect, start, arcSweep, false, glow);
        canvas.drawArc(rect, start, arcSweep, false, done);
      }
    }

    // Inner points ring.
    final innerRect = Rect.fromCircle(
      center: center,
      radius: radius - stroke * 1.7,
    );
    canvas.drawArc(
      innerRect,
      0,
      2 * math.pi,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = innerStroke
        ..color = AppColors.accentSoft.withValues(alpha: 0.6),
    );
    if (pointsProgress > 0) {
      canvas.drawArc(
        innerRect,
        -math.pi / 2,
        2 * math.pi * pointsProgress,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = innerStroke
          ..strokeCap = StrokeCap.round
          ..color = AppColors.accent,
      );
    }
  }

  @override
  bool shouldRepaint(_SegmentedRingPainter old) =>
      old.segments != segments ||
      old.filled != filled ||
      old.pointsProgress != pointsProgress;
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
              : AppColors.border,
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
                    color: AppColors.accentSoft.withValues(
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
                        color: AppColors.accent,
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
              color: AppColors.accentSoft,
            ),
            child: const Icon(
              Symbols.eco_rounded,
              size: 48,
              fill: 1,
              color: AppColors.primaryDark,
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
