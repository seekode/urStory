import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_constants.dart';

/// Horizontal scrollable row of genre tags
class StoryGenresRow extends StatelessWidget {
  final List<String> genres;

  const StoryGenresRow({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) return const SizedBox.shrink();

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: AppConstants.spacingSm,
        ),
        itemBuilder: (context, index) {
          return _GenreTag(
            label: genres[index],
            isDark: isDark,
          );
        },
      ),
    );
  }
}

class _GenreTag extends StatelessWidget {
  final String label;
  final bool isDark;

  const _GenreTag({
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkAccentSecondary.withValues(alpha: 0.15)
            : AppColors.lightAccentSecondary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isDark
              ? AppColors.darkAccentSecondary
              : AppColors.lightAccentSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
