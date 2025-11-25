import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_constants.dart';

/// Section header with title and optional "See more" button
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeMore,
  });

  final String title;
  final VoidCallback? onSeeMore;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.marginMobile,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (onSeeMore != null)
            GestureDetector(
              onTap: onSeeMore,
              child: Text(
                'Voir plus',
                style: TextStyle(
                  color: isDark
                      ? AppColors.darkAccentPrimary
                      : AppColors.lightAccentPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
