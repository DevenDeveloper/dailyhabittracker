import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/app_theme.dart';

Widget _bone({double? width, required double height, double radius = 16}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(radius),
      ),
    );

Widget _shimmer(Widget child) => Shimmer.fromColors(
  baseColor: const Color(0xFFEBD6B0),
  highlightColor: const Color(0xFFFCF3E2),
  child: child,
);

class TodaySkeleton extends StatelessWidget {
  const TodaySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return _shimmer(
      ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          _bone(height: 160, radius: 24),
          const SizedBox(height: 20),
          for (var i = 0; i < 5; i++) ...[
            _bone(height: 76),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class DetailSkeleton extends StatelessWidget {
  const DetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return _shimmer(
      ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
        children: [
          _bone(width: 220, height: 32, radius: 10),
          const SizedBox(height: 12),
          _bone(height: 18, radius: 8),
          const SizedBox(height: 24),
          Row(
            children: [
              for (var i = 0; i < 3; i++) ...[
                Expanded(child: _bone(height: 96, radius: 18)),
                if (i < 2) const SizedBox(width: 12),
              ],
            ],
          ),
          const SizedBox(height: 24),
          _bone(height: 120, radius: 20),
          const SizedBox(height: 32),
          _bone(height: 54, radius: 14),
        ],
      ),
    );
  }
}
