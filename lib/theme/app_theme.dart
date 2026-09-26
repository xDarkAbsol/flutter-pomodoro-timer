import 'package:flutter/material.dart';

abstract class AppSpacing {
  //* Spacing
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;

  //* Pre-Build SizedBoxes
  static const SizedBox gapSm = SizedBox(width: sm, height: sm);
  static const SizedBox gapMd = SizedBox(width: md, height: md);
  static const SizedBox gapLg = SizedBox(width: lg, height: lg);

  //* BorderRadius
  static final radiusSm = BorderRadius.circular(8);
  static final radiusMd = BorderRadius.circular(12);
  static final radiusLg = BorderRadius.circular(16);
  static final radiusPill = BorderRadius.circular(100);
}

abstract class AppColors {
  static const bgLight = Color(0xFFF8FAFC);
  static const surface = Color(0xFFFFFFFF);
  static const border = Color(0xFFE2E8F0);
  static const textPrimary = Color(0xFF0F172A);
  static const textMuted = Color(0xFF64748B);

  // Mode Accent Colors
  static const work = Color(0xFF4F46E5); // Indigo for Work
  static const workSoft = Color(0xFFEEF2FF);

  static const shortBreak = Color(0xFF0D9488); // Teal for Short Break
  static const shortBreakSoft = Color(0xFFCCFBF1);

  static const longBreak = Color(0xFFD97706); // Amber for Long Break
  static const longBreakSoft = Color(0xFFFEF3C7);

  // Dynamic Background Colors
  static const workBg = Color(0xFFF5F3FF); // Extremely soft lavender/indigo
  static const shortBreakBg = Color(0xFFF0FDFA); // Extremely soft ice-teal
  static const longBreakBg = Color(0xFFFFFBEB);
}

abstract class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bgLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.work,
        onSurface: AppColors.textPrimary,
        outline: AppColors.textMuted,
        surface: AppColors.surface,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.textMuted,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
