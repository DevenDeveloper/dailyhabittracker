import 'package:flutter/material.dart';

/// Palette: rose #C78997, peach #F5B297, sand #F5D6A2, cream #F5E4C4,
/// slate #8A99B1; ink/muted/border are neutrals derived from it.
class AppColors {
  static const rose = Color(0xFFC78997);
  static const peach = Color(0xFFF5B297);
  static const sand = Color(0xFFF5D6A2);
  static const cream = Color(0xFFF5E4C4);
  static const slate = Color(0xFF8A99B1);

  static const ink = Color(0xFF3A2F36);
  static const textMuted = Color(0xFF7D6E6E);
  static const onAccent = Color(0xFF6B4A3A);
  static const card = Color(0xFFFCF6EA);
  static const doneTint = Color(0xFFE4E8F0); // slate, lightened
  static final softShadow = [
    BoxShadow(
      color: primary.withValues(alpha: 0.10),
      blurRadius: 18,
      offset: const Offset(0, 6),
    ),
  ];
  static const border = Color(0xFFE6D2AE);
  static const error = Color(0xFFB4474F);

  static const primary = slate;
  static const primaryDark = Color(0xFF5F6F8C); // slate, darkened for text
  static const track = Color(0xFFDDE3EC); // slate, lightened
  static const accent = sand;
  static const success = primary; // "done"
  static const background = Colors.white;
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
      backgroundColor: AppColors.sand,
      selectedColor: AppColors.peach,
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
      hintStyle: const TextStyle(color: Color(0xFFA8999A)),
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
