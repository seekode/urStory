import 'package:flutter/material.dart';

/// App color palette for UrStory
class AppColors {
  AppColors._();

  // ===== LIGHT THEME =====

  // Backgrounds & Surfaces
  static const Color lightBackgroundPrimary = Color(0xFFFAF9F7); // Main app background
  static const Color lightSurfaceElevated = Color(0xFFFFFFFF); // Cards, navbar, modals
  static const Color lightSurfaceSecondary = Color(0xFFF0EDE8); // Secondary distinction zones

  // Text Colors
  static const Color lightTextPrimary = Color(0xFF1F1F1F); // Body text, titles
  static const Color lightTextSecondary = Color(0xFF5A5A5A); // Metadata, subtitles
  static const Color lightTextTertiary = Color(0xFF8E8E8E); // Placeholders, non-critical info

  // Accent Colors
  static const Color lightAccentPrimary = Color(0xFF6B9080); // Main actions, links
  static const Color lightAccentPrimaryHover = Color(0xFF5A7A6B); // Hover/pressed states
  static const Color lightAccentSecondary = Color(0xFFD4A574); // Badges, special tags
  static const Color lightAccentTertiary = Color(0xFFA4B8C4); // Secondary elements

  // Status Colors
  static const Color lightSuccess = Color(0xFF7BA882);
  static const Color lightError = Color(0xFFD87676);
  static const Color lightWarning = Color(0xFFE8B863);
  static const Color lightInfo = Color(0xFF7BA5BC);

  // Borders & Dividers
  static const Color lightBorderSubtle = Color(0xFFE8E5E0); // Subtle separators
  static const Color lightBorderVisible = Color(0xFFD4CFC7); // Frames, delimitations

  // ===== DARK THEME =====

  // Backgrounds & Surfaces
  static const Color darkBackgroundPrimary = Color(0xFF1A1A1C); // Main app background
  static const Color darkSurfaceElevated = Color(0xFF252527); // Cards, navbar, modals
  static const Color darkSurfaceSecondary = Color(0xFF2E2E30); // Secondary distinction zones

  // Text Colors
  static const Color darkTextPrimary = Color(0xFFF0F0F2); // Body text, titles
  static const Color darkTextSecondary = Color(0xFFB8B8BD); // Metadata, subtitles
  static const Color darkTextTertiary = Color(0xFF75757A); // Placeholders, non-critical info

  // Accent Colors
  static const Color darkAccentPrimary = Color(0xFF83AB96); // Main actions, links
  static const Color darkAccentPrimaryHover = Color(0xFF9DBFAC); // Hover/pressed states
  static const Color darkAccentSecondary = Color(0xFFD9B388); // Badges, special tags
  static const Color darkAccentTertiary = Color(0xFF99B4C9); // Secondary elements

  // Status Colors
  static const Color darkSuccess = Color(0xFF8CBB92);
  static const Color darkError = Color(0xFFE68989);
  static const Color darkWarning = Color(0xFFF0C670);
  static const Color darkInfo = Color(0xFF8AB7CE);

  // Borders & Dividers
  static const Color darkBorderSubtle = Color(0xFF38383A); // Subtle separators
  static const Color darkBorderVisible = Color(0xFF4A4A4D); // Frames, delimitations
}
