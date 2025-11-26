import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_constants.dart';
import 'widgets/categories_section.dart';
import 'widgets/recent_stories_section.dart';
import 'widgets/section_header.dart';
import 'widgets/trending_section.dart';

/// Discover screen - Main home page with categories, trending and recent stories
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark
          ? AppColors.darkBackgroundPrimary
          : AppColors.lightBackgroundPrimary,
      child: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                // Categories section
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppConstants.marginMobile,
                    AppConstants.spacingLg,
                    AppConstants.marginMobile,
                    AppConstants.spacingLg,
                  ),
                  child: Text(
                    'Découvrir',
                    style: TextStyle(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                // App title
                SectionHeader(
                  title: 'Catégories',
                  onSeeMore: () {
                    // TODO: Navigate to all categories
                  },
                ),
                SizedBox(height: AppConstants.spacingMd),
                CategoriesSection(),

                // Spacing
                SizedBox(height: AppConstants.spacingXl),

                // Trending section
                SectionHeader(
                  title: 'En tendance',
                  onSeeMore: () {
                    // TODO: Navigate to all trending
                  },
                ),
                SizedBox(height: AppConstants.spacingMd),
                TrendingSection(),

                // Spacing
                SizedBox(height: AppConstants.spacingXl),

                // Recent stories section
                SectionHeader(
                  title: 'Récemment ajoutées',
                  onSeeMore: () {
                    // TODO: Navigate to all recent
                  },
                ),
                SizedBox(height: AppConstants.spacingMd),
              ]),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.marginMobile,
              ),
              sliver: RecentStoriesSection(),
            ),

            // Bottom padding for navbar
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}
