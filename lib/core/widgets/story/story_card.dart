import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_constants.dart';

/// Horizontal story card for lists, search results, recent stories, etc.
/// This is the primary story display widget used throughout the app.
class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.title,
    required this.coverUrl,
    required this.likes,
    required this.reads,
    required this.chapters,
    this.onTap,
  });

  final String title;
  final String coverUrl;
  final int likes;
  final int reads;
  final int chapters;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkSurfaceElevated
              : AppColors.lightSurfaceElevated,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusCard),
          boxShadow:
              isDark ? AppConstants.shadowDarkLight : AppConstants.shadowLight,
        ),
        child: Row(
          children: [
            // Cover image
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(AppConstants.borderRadiusCard),
              ),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Image.network(
                  coverUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: isDark
                        ? AppColors.darkSurfaceSecondary
                        : AppColors.lightSurfaceSecondary,
                    child: Icon(
                      Icons.auto_stories_outlined,
                      color: isDark
                          ? AppColors.darkTextTertiary
                          : AppColors.lightTextTertiary,
                      size: AppConstants.iconSizeLarge,
                    ),
                  ),
                ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    Text(
                      title,
                      style: TextStyle(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppConstants.spacingSm),
                    // Stats row
                    Row(
                      children: [
                        _StatChip(
                          icon: Icons.favorite_outline,
                          value: _formatNumber(likes),
                          isDark: isDark,
                        ),
                        const SizedBox(width: AppConstants.spacingMd),
                        _StatChip(
                          icon: Icons.visibility_outlined,
                          value: _formatNumber(reads),
                          isDark: isDark,
                        ),
                        const SizedBox(width: AppConstants.spacingMd),
                        _StatChip(
                          icon: Icons.menu_book_outlined,
                          value: chapters.toString(),
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.value,
    required this.isDark,
  });

  final IconData icon;
  final String value;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: isDark ? AppColors.darkTextTertiary : AppColors.lightTextTertiary,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            color:
                isDark ? AppColors.darkTextTertiary : AppColors.lightTextTertiary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
