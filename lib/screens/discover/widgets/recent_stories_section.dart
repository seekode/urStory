import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_constants.dart';
import '../../../core/widgets/story/story_card.dart';
import '../../../providers/story/discover_provider.dart';

/// Recent stories vertical list (as sliver)
class RecentStoriesSection extends ConsumerWidget {
  const RecentStoriesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentStories = ref.watch(recentStoriesProvider);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final story = recentStories[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < recentStories.length - 1
                  ? AppConstants.spacingMd
                  : 0,
            ),
            child: StoryCard(
              title: story.title,
              coverUrl: story.coverUrl,
              likes: story.totalLikes,
              reads: story.totalViews,
              chapters: story.totalChapters,
              onTap: () => router.push(AppRoutes.storyDetail, extra: story),
            ),
          );
        },
        childCount: recentStories.length,
      ),
    );
  }
}
