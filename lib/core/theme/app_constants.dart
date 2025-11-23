import 'package:flutter/material.dart';

/// Design system constants for spacing, sizing, and styling
/// All values follow the design system specifications from DESIGN.md
class AppConstants {
  AppConstants._(); // Private constructor to prevent instantiation

  // ═══════════════════════════════════════════════════════════════════════════
  // Border Radius
  // ═══════════════════════════════════════════════════════════════════════════

  /// Border radius for floating containers (navbar, modals, dialogs)
  static const double borderRadiusFloating = 28.0;

  /// Border radius for cards and elevated surfaces
  static const double borderRadiusCard = 16.0;

  /// Border radius for buttons
  static const double borderRadiusButton = 12.0;

  /// Border radius for input fields
  static const double borderRadiusInput = 20.0;

  /// Border radius for tabs in tab bars
  static const double borderRadiusTab = 14.0;

  /// Border radius for tags and badges
  static const double borderRadiusTag = 8.0;

  /// Border radius for small elements (chips, avatars)
  static const double borderRadiusSmall = 6.0;

  // ═══════════════════════════════════════════════════════════════════════════
  // Spacing
  // ═══════════════════════════════════════════════════════════════════════════

  /// Extra small spacing (4px)
  static const double spacingXs = 4.0;

  /// Small spacing (8px)
  static const double spacingSm = 8.0;

  /// Medium spacing (12px)
  static const double spacingMd = 12.0;

  /// Default spacing (16px)
  static const double spacing = 16.0;

  /// Large spacing (24px)
  static const double spacingLg = 24.0;

  /// Extra large spacing (32px)
  static const double spacingXl = 32.0;

  /// Extra extra large spacing (40px)
  static const double spacingXxl = 40.0;

  /// Huge spacing (48px)
  static const double spacingHuge = 48.0;

  /// Side margins for mobile screens
  static const double marginMobile = 20.0;

  /// Side margins for tablet and larger screens
  static const double marginTablet = 24.0;

  // ═══════════════════════════════════════════════════════════════════════════
  // Shadows
  // ═══════════════════════════════════════════════════════════════════════════

  /// Light shadow for subtle elevation (cards, buttons)
  static List<BoxShadow> get shadowLight => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ];

  /// Medium shadow for moderate elevation (modals, dropdowns)
  static List<BoxShadow> get shadowMedium => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  /// Strong shadow for high elevation (floating elements, dialogs)
  static List<BoxShadow> get shadowStrong => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.12),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ];

  /// Shadow for dark mode - light variant
  static List<BoxShadow> get shadowDarkLight => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  /// Shadow for dark mode - medium variant
  static List<BoxShadow> get shadowDarkMedium => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.25),
          blurRadius: 12,
          offset: const Offset(0, 3),
        ),
      ];

  /// Shadow for dark mode - strong variant
  static List<BoxShadow> get shadowDarkStrong => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.35),
          blurRadius: 20,
          offset: const Offset(0, 6),
        ),
      ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Animation Durations
  // ═══════════════════════════════════════════════════════════════════════════

  /// Fast animation (150ms) - for micro-interactions
  static const Duration durationFast = Duration(milliseconds: 150);

  /// Standard animation (200ms) - for most UI transitions
  static const Duration durationStandard = Duration(milliseconds: 200);

  /// Medium animation (300ms) - for complex transitions
  static const Duration durationMedium = Duration(milliseconds: 300);

  /// Slow animation (350ms) - for page transitions
  static const Duration durationSlow = Duration(milliseconds: 350);

  /// Very slow animation (500ms) - for special effects
  static const Duration durationVerySlow = Duration(milliseconds: 500);

  // ═══════════════════════════════════════════════════════════════════════════
  // Animation Curves
  // ═══════════════════════════════════════════════════════════════════════════

  /// Standard easing curve for most animations
  static const Cubic curveStandard = Cubic(0.4, 0.0, 0.2, 1);

  /// Ease out curve for entering animations
  static const Cubic curveEaseOut = Cubic(0.0, 0.0, 0.2, 1);

  /// Ease in curve for exiting animations
  static const Cubic curveEaseIn = Cubic(0.4, 0.0, 1, 1);

  // ═══════════════════════════════════════════════════════════════════════════
  // Page Transition
  // ═══════════════════════════════════════════════════════════════════════════

  /// Horizontal offset for page slide transitions
  static const double pageTransitionOffset = 0.15;

  // ═══════════════════════════════════════════════════════════════════════════
  // UI Element Sizes
  // ═══════════════════════════════════════════════════════════════════════════

  /// Standard button height
  static const double buttonHeight = 50.0;

  /// Small button height
  static const double buttonHeightSmall = 40.0;

  /// Large button height
  static const double buttonHeightLarge = 56.0;

  /// Standard icon size
  static const double iconSize = 24.0;

  /// Small icon size
  static const double iconSizeSmall = 20.0;

  /// Large icon size
  static const double iconSizeLarge = 32.0;

  /// Standard avatar size
  static const double avatarSize = 40.0;

  /// Small avatar size
  static const double avatarSizeSmall = 32.0;

  /// Large avatar size
  static const double avatarSizeLarge = 56.0;

  // ═══════════════════════════════════════════════════════════════════════════
  // Input Field Sizing
  // ═══════════════════════════════════════════════════════════════════════════

  /// Horizontal padding for input fields
  static const double inputPaddingHorizontal = 20.0;

  /// Vertical padding for input fields
  static const double inputPaddingVertical = 16.0;

  /// Border width for input fields
  static const double inputBorderWidth = 1.0;

  /// Border width for focused input fields
  static const double inputBorderWidthFocused = 2.0;

  // ═══════════════════════════════════════════════════════════════════════════
  // Floating Navigation Bar
  // ═══════════════════════════════════════════════════════════════════════════

  /// Bottom margin for floating navbar
  static const double navbarMarginBottom = 20.0;

  /// Horizontal margin for floating navbar
  static const double navbarMarginHorizontal = 20.0;

  /// Horizontal padding inside navbar
  static const double navbarPaddingHorizontal = 12.0;

  /// Vertical padding inside navbar
  static const double navbarPaddingVertical = 8.0;
}
