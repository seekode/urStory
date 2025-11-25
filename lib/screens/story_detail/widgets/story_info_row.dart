import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_constants.dart';

/// Row displaying story stats (likes, views, chapters)
class StoryInfoRow extends StatelessWidget {
  final int likes;
  final int views;
  final int chapters;

  const StoryInfoRow({
    super.key,
    required this.likes,
    required this.views,
    required this.chapters,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        // Likes
        Expanded(
          child: _InfoItem(
            label: 'Likes',
            value: _formatNumber(likes),
            isDark: isDark,
          ),
        ),

        // Views
        Expanded(
          child: _InfoItem(
            label: 'Vues',
            value: _formatNumber(views),
            isDark: isDark,
          ),
        ),

        // Chapters
        Expanded(
          child: _InfoItem(
            label: 'Chapitres',
            value: chapters.toString(),
            isDark: isDark,
          ),
        ),
      ],
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

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;

  const _InfoItem({
    required this.label,
    required this.value,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: isDark
                ? AppColors.darkTextTertiary
                : AppColors.lightTextTertiary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppConstants.spacingXs),
        Text(
          value,
          style: TextStyle(
            color: isDark
                ? AppColors.darkTextPrimary
                : AppColors.lightTextPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
