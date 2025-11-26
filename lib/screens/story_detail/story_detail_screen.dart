import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/router/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_constants.dart';
import '../../core/widgets/ui/buttons/custom_button.dart';
import '../../models/story/story_details.dart';
import 'widgets/story_genres_row.dart';
import 'widgets/story_info_row.dart';

/// Story detail screen - Shows full story information
class StoryDetailScreen extends ConsumerWidget {
  final StoryDetails storyDetails;

  const StoryDetailScreen({super.key, required this.storyDetails});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final backgroundColor = isDark
        ? AppColors.darkBackgroundPrimary
        : AppColors.lightBackgroundPrimary;

    // Card starts at ~50% of screen height
    final imageHeight = screenHeight * 0.55;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Column(
              children: [
                // Cover image with gradient fade
                Stack(
                  children: [
                    // Cover image
                    SizedBox(
                      height: imageHeight,
                      width: screenWidth,
                      child: storyDetails.coverUrl != null &&
                              storyDetails.coverUrl!.isNotEmpty
                          ? Image.network(
                              storyDetails.coverUrl!,
                              width: screenWidth,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              errorBuilder: (context, error, stackTrace) =>
                                  _buildPlaceholder(isDark),
                            )
                          : _buildPlaceholder(isDark),
                    ),

                    // Gradient fade at bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              backgroundColor.withValues(alpha: 0),
                              backgroundColor.withValues(alpha: 0.5),
                              backgroundColor,
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Negative margin to overlap the card on the image
                Transform.translate(
                  offset: const Offset(0, -60),
                  child: Column(
                    children: [
                      // Info card
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppConstants.marginMobile,
                        ),
                        padding: const EdgeInsets.all(AppConstants.spacingLg),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurfaceElevated
                              : AppColors.lightSurfaceElevated,
                          borderRadius: BorderRadius.circular(
                            AppConstants.borderRadiusCard,
                          ),
                          boxShadow: isDark
                              ? AppConstants.shadowDarkMedium
                              : AppConstants.shadowMedium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              storyDetails.title,
                              style: TextStyle(
                                color: isDark
                                    ? AppColors.darkTextPrimary
                                    : AppColors.lightTextPrimary,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: AppConstants.spacingXs),

                            // Author
                            Text(
                              'par ${storyDetails.authorName}',
                              style: TextStyle(
                                color: isDark
                                    ? AppColors.darkAccentPrimary
                                    : AppColors.lightAccentPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: AppConstants.spacingMd),

                            // Genres row
                            StoryGenresRow(
                              genres: storyDetails.genres
                                  .map((g) => g.name)
                                  .toList(),
                            ),
                            const SizedBox(height: AppConstants.spacingLg),

                            // Info row (likes, views, chapters)
                            StoryInfoRow(
                              likes: storyDetails.totalLikes,
                              views: storyDetails.totalViews,
                              chapters: storyDetails.totalChapters,
                            ),

                            // Divider
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppConstants.spacingLg,
                              ),
                              child: Divider(
                                color: isDark
                                    ? AppColors.darkBorderSubtle
                                    : AppColors.lightBorderSubtle,
                                height: 1,
                              ),
                            ),

                            // Summary
                            Text(
                              storyDetails.summary?.isNotEmpty == true
                                  ? storyDetails.summary!
                                  : 'Aucun résumé disponible.',
                              style: TextStyle(
                                color: isDark
                                    ? AppColors.darkTextSecondary
                                    : AppColors.lightTextSecondary,
                                fontSize: 15,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Start reading button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.marginMobile,
                          vertical: AppConstants.spacingMd,
                        ),
                        child: CustomButton(
                          onPressed: () {
                            // TODO: Navigate to reading screen
                          },
                          text: 'Commencer la lecture',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Back button (fixed position)
          Positioned(
            top: MediaQuery.of(context).padding.top + AppConstants.spacingSm,
            left: AppConstants.marginMobile,
            child: _BackButton(onTap: () => router.pop(), isDark: isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(bool isDark) {
    return Container(
      color: isDark
          ? AppColors.darkSurfaceSecondary
          : AppColors.lightSurfaceSecondary,
      child: Center(
        child: Icon(
          Icons.auto_stories_outlined,
          color: isDark
              ? AppColors.darkTextTertiary
              : AppColors.lightTextTertiary,
          size: 64,
        ),
      ),
    );
  }
}

/// Back button widget
class _BackButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isDark;

  const _BackButton({required this.onTap, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.spacingSm),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkSurfaceElevated.withValues(alpha: 0.9)
              : AppColors.lightSurfaceElevated.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusCard),
          boxShadow: isDark
              ? AppConstants.shadowDarkLight
              : AppConstants.shadowLight,
        ),
        child: Icon(
          Icons.arrow_back,
          color: isDark
              ? AppColors.darkTextPrimary
              : AppColors.lightTextPrimary,
          size: AppConstants.iconSize,
        ),
      ),
    );
  }
}
