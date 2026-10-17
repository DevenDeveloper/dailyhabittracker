import 'package:flutter/material.dart';

/// Teal + amber palette on a white canvas.
class AppColors {
  static const primary = Color(0xFF0F766E); // teal, 5.5:1 with white
  static const primaryDark = Color(0xFF0B5550);
  static const primaryLight = Color(0xFF2DB3A5);

  static const accent = Color(0xFFF59E0B); // amber: points, flame
  static const accentSoft = Color(0xFFFDE8B4);
  static const onAccent = Color(0xFF7A4B00);

  static const ink = Color(0xFF10302D);
  static const textMuted = Color(0xFF5F7774);
  static const card = Color(0xFFF3FAF8);
  static const mint = Color(0xFFE6F5F2);
  static const doneTint = Color(0xFFDFF3EF);
  static const track = Color(0xFFD8ECE8);
  static const border = Color(0xFFD3E6E2);
  static const error = Color(0xFFB42318);

  static const success = primary; // "done"
  static const background = Colors.white;

  static final softShadow = [
    BoxShadow(
      color: primary.withValues(alpha: 0.10),
      blurRadius: 18,
      offset: const Offset(0, 6),
    ),
  ];
}

ThemeData buildAppTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    onPrimary: AppColors.ink,
    surface: AppColors.card,
    onSurface: AppColors.ink,
    error: AppColors.error,
  );
  OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(color: c, width: w),
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: AppColors.ink,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      extendedTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.accentSoft,
      selectedColor: AppColors.accent,
      checkmarkColor: AppColors.ink,
      side: BorderSide.none,
      labelStyle: const TextStyle(
        color: AppColors.onAccent,
        fontWeight: FontWeight.w700,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.card,
      border: border(AppColors.border),
      enabledBorder: border(AppColors.border),
      focusedBorder: border(AppColors.primary, 2),
      errorBorder: border(AppColors.error),
      focusedErrorBorder: border(AppColors.error, 2),
      hintStyle: const TextStyle(color: Color(0xFF9AB3AF)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryDark,
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
  );
}
