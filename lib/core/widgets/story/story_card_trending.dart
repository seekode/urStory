import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_constants.dart';

/// Vertical story card for trending/featured stories
/// Used in horizontal scrollable lists (trending section, featured, etc.)
class StoryCardTrending extends StatelessWidget {
  const StoryCardTrending({
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
        width: 165,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkSurfaceElevated
              : AppColors.lightSurfaceElevated,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusCard),
          boxShadow: isDark
              ? AppConstants.shadowDarkLight
              : AppConstants.shadowLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover image
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppConstants.borderRadiusCard),
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
            Padding(
              padding: const EdgeInsets.all(AppConstants.spacingSm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title - single line with ellipsis
                  Text(
                    title,
                    style: TextStyle(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppConstants.spacingXs),
                  // Stats row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatItem(
                        icon: Icons.favorite_outline,
                        value: _formatNumber(likes),
                        isDark: isDark,
                      ),
                      _StatItem(
                        icon: Icons.visibility_outlined,
                        value: _formatNumber(reads),
                        isDark: isDark,
                      ),
                      _StatItem(
                        icon: Icons.menu_book_outlined,
                        value: chapters.toString(),
                        isDark: isDark,
                      ),
                    ],
                  ),
                ],
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

class _StatItem extends StatelessWidget {
  const _StatItem({
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
          size: 12,
          color: isDark
              ? AppColors.darkTextTertiary
              : AppColors.lightTextTertiary,
        ),
        const SizedBox(width: 2),
        Text(
          value,
          style: TextStyle(
            color: isDark
                ? AppColors.darkTextTertiary
                : AppColors.lightTextTertiary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
