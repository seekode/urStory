import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_constants.dart';

/// Tab selector widget for switching between login and signup
class AuthTabSelector extends StatelessWidget {
  final bool isLoginSelected;
  final VoidCallback onLoginTap;
  final VoidCallback onSignupTap;

  const AuthTabSelector({
    super.key,
    required this.isLoginSelected,
    required this.onLoginTap,
    required this.onSignupTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.marginMobile),
      padding: const EdgeInsets.all(AppConstants.spacingSm - 2),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceSecondary
            : AppColors.lightSurfaceSecondary,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusInput),
      ),
      child: Row(
        children: [
          _AuthTab(
            label: 'Connexion',
            isSelected: isLoginSelected,
            isDark: isDark,
            onTap: onLoginTap,
          ),
          const SizedBox(width: AppConstants.spacingSm - 2),
          _AuthTab(
            label: 'Inscription',
            isSelected: !isLoginSelected,
            isDark: isDark,
            onTap: onSignupTap,
          ),
        ],
      ),
    );
  }
}

/// Individual tab within the tab selector
class _AuthTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _AuthTab({
    required this.label,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Animated background (fade + scale)
            Positioned.fill(
              child: AnimatedScale(
                scale: isSelected ? 1.0 : 0.92,
                duration: AppConstants.durationStandard,
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: isSelected ? 1.0 : 0.0,
                  duration: AppConstants.durationStandard,
                  curve: Curves.easeOut,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkSurfaceElevated
                          : AppColors.lightSurfaceElevated,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusTab),
                      boxShadow: isDark
                          ? AppConstants.shadowDarkLight
                          : AppConstants.shadowLight,
                    ),
                  ),
                ),
              ),
            ),
            // Text always visible
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppConstants.spacing - 2),
              child: AnimatedDefaultTextStyle(
                duration: AppConstants.durationStandard,
                curve: Curves.easeOut,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected
                      ? (isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary)
                      : (isDark
                          ? AppColors.darkTextTertiary
                          : AppColors.lightTextTertiary),
                ),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
