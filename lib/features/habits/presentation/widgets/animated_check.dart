import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/theme/app_theme.dart';

/// Round check button: fills with a spring "pop" when marked done.
class AnimatedCheck extends StatelessWidget {
  const AnimatedCheck({
    super.key,
    required this.isDone,
    required this.onTap,
    this.size = 34,
  });

  final bool isDone;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: isDone ? 'Mark not done' : 'Mark done',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutCubic,
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDone ? AppColors.primary : Colors.transparent,
              border: Border.all(
                color: isDone ? AppColors.primary : const Color(0xFFD3BC93),
                width: 2.5,
              ),
              boxShadow: isDone
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : const [],
            ),
            child: AnimatedScale(
              scale: isDone ? 1 : 0,
              duration: const Duration(milliseconds: 420),
              curve: isDone ? Curves.elasticOut : Curves.easeIn,
              child: Icon(
                Symbols.check_rounded,
                weight: 800,
                color: Colors.white,
                size: size * 0.55,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
