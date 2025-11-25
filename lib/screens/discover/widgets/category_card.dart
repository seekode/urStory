import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_constants.dart';

/// Category card widget for horizontal scrollable list
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.onTap,
  });

  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusCard),
          boxShadow: isDark
              ? AppConstants.shadowDarkLight
              : AppConstants.shadowLight,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusCard),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: isDark
                      ? AppColors.darkSurfaceSecondary
                      : AppColors.lightSurfaceSecondary,
                  child: Icon(
                    Icons.image_outlined,
                    color: isDark
                        ? AppColors.darkTextTertiary
                        : AppColors.lightTextTertiary,
                  ),
                ),
              ),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
              // Title
              Positioned(
                left: AppConstants.spacingMd,
                right: AppConstants.spacingMd,
                bottom: AppConstants.spacingSm,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
