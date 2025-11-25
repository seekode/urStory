import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_constants.dart';

/// Button variant types
enum ButtonVariant { primary, secondary, outlined, text }

/// Custom button with consistent styling across the app
class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final ButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  final double borderRadius;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.icon,
    this.borderRadius = AppConstants.borderRadiusInput,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Determine colors based on variant
    Color backgroundColor;
    Color textColor;
    Color? borderColor;

    switch (variant) {
      case ButtonVariant.primary:
        backgroundColor = isDark
            ? AppColors.darkAccentPrimary
            : AppColors.lightAccentPrimary;
        textColor = Colors.white;
        borderColor = null;
        break;
      case ButtonVariant.secondary:
        backgroundColor = isDark
            ? AppColors.darkAccentSecondary
            : AppColors.lightAccentSecondary;
        textColor = isDark
            ? AppColors.darkTextPrimary
            : AppColors.lightTextPrimary;
        borderColor = null;
        break;
      case ButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        textColor = isDark
            ? AppColors.darkAccentPrimary
            : AppColors.lightAccentPrimary;
        borderColor = isDark
            ? AppColors.darkAccentPrimary
            : AppColors.lightAccentPrimary;
        break;
      case ButtonVariant.text:
        backgroundColor = Colors.transparent;
        textColor = isDark
            ? AppColors.darkAccentPrimary
            : AppColors.lightAccentPrimary;
        borderColor = null;
        break;
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppConstants.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          disabledBackgroundColor: backgroundColor.withValues(alpha: 0.6),
          disabledForegroundColor: textColor.withValues(alpha: 0.6),
          elevation:
              variant == ButtonVariant.primary ||
                  variant == ButtonVariant.secondary
              ? 0
              : 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderColor != null
                ? BorderSide(color: borderColor, width: 1.5)
                : BorderSide.none,
          ),
          padding:
              padding ??
              const EdgeInsets.symmetric(
                horizontal: AppConstants.spacing + 8,
                vertical: AppConstants.spacingMd,
              ),
        ),
        child: isLoading
            ? SizedBox(
                height: AppConstants.iconSizeSmall,
                width: AppConstants.iconSizeSmall,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: AppConstants.iconSizeSmall),
                  const SizedBox(width: AppConstants.spacingSm),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
      ),
    );
  }
}
