import 'package:flutter/material.dart';

/// Typography system for UrStory
/// Headings: Modern sans-serif (Inter-like style)
/// Body: Serif for reading comfort
class AppTypography {
  AppTypography._();

  // Base font families
  static const String headingFont =
      'SF Pro Display'; // Fallback to system sans-serif
  static const String bodyFont = 'Georgia'; // Fallback to system serif

  /// Generate TextTheme for the app
  static TextTheme getTextTheme(Color textColor, Color secondaryTextColor) {
    return TextTheme(
      // Display styles (largest headings)
      displayLarge: TextStyle(
        fontFamily: headingFont,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        height: 1.2,
        color: textColor,
      ),
      displayMedium: TextStyle(
        fontFamily: headingFont,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        height: 1.2,
        color: textColor,
      ),
      displaySmall: TextStyle(
        fontFamily: headingFont,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.25,
        height: 1.3,
        color: textColor,
      ),

      // Headline styles
      headlineLarge: TextStyle(
        fontFamily: headingFont,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        height: 1.3,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: headingFont,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.3,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: headingFont,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.4,
        color: textColor,
      ),

      // Title styles
      titleLarge: TextStyle(
        fontFamily: headingFont,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.4,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontFamily: headingFont,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.4,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontFamily: headingFont,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.4,
        color: textColor,
      ),

      // Body styles (serif for reading)
      bodyLarge: TextStyle(
        fontFamily: bodyFont,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.5,
        height: 1.6,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: bodyFont,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25,
        height: 1.6,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontFamily: bodyFont,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.4,
        height: 1.5,
        color: secondaryTextColor,
      ),

      // Label styles
      labelLarge: TextStyle(
        fontFamily: headingFont,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.4,
        color: textColor,
      ),
      labelMedium: TextStyle(
        fontFamily: headingFont,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.4,
        color: secondaryTextColor,
      ),
      labelSmall: TextStyle(
        fontFamily: headingFont,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.4,
        color: secondaryTextColor,
      ),
    );
  }
}
