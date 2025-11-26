import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_constants.dart';
import '../../../core/widgets/story/story_card_trending.dart';
import '../../../providers/story/discover_provider.dart';

/// Trending stories horizontal list
class TrendingSection extends ConsumerWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingStories = ref.watch(trendingStoriesProvider);

    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.marginMobile,
        ),
        itemCount: trendingStories.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: AppConstants.spacingMd,
        ),
        itemBuilder: (context, index) {
          final story = trendingStories[index];
          return StoryCardTrending(
            title: story.title,
            coverUrl: story.coverUrl,
            likes: story.totalLikes,
            reads: story.totalViews,
            chapters: story.totalChapters,
            onTap: () => router.push(AppRoutes.storyDetail, extra: story),
          );
        },
      ),
    );
  }
}
