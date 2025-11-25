import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Main theme configuration for UrStory
/// Note: We use custom widgets (CustomButton, CustomTextField, etc.) instead of Material components
/// This theme only configures essential properties like colors, scaffold background, and typography
class AppTheme {
  AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme {
    final textTheme = AppTypography.getTextTheme(
      AppColors.lightTextPrimary,
      AppColors.lightTextSecondary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Scaffold background
      scaffoldBackgroundColor: AppColors.lightBackgroundPrimary,

      // System UI overlay (status bar)
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      // Typography
      textTheme: textTheme,
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    final textTheme = AppTypography.getTextTheme(
      AppColors.darkTextPrimary,
      AppColors.darkTextSecondary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Scaffold background
      scaffoldBackgroundColor: AppColors.darkBackgroundPrimary,

      // System UI overlay (status bar)
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      // Typography
      textTheme: textTheme,
    );
  }
}
