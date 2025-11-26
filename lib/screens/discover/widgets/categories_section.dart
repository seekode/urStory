import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_constants.dart';
import '../../../core/widgets/story/category_card.dart';
import '../../../providers/story/genre_provider.dart';

/// Categories horizontal list (2 rows)
class CategoriesSection extends ConsumerWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(genresProvider);

    return SizedBox(
      height: 176, // 2 cards (80px each) + spacing (16px)
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.marginMobile,
        ),
        itemCount: (genres.length / 2).ceil(),
        itemBuilder: (context, columnIndex) {
          final topIndex = columnIndex * 2;
          final bottomIndex = topIndex + 1;

          return Padding(
            padding: EdgeInsets.only(
              right: columnIndex < (genres.length / 2).ceil() - 1
                  ? AppConstants.spacingMd
                  : 0,
            ),
            child: Column(
              children: [
                // Top card
                if (topIndex < genres.length)
                  CategoryCard(
                    title: genres[topIndex].name,
                    imageUrl: genres[topIndex].coverUrl,
                    onTap: () {
                      // TODO: Navigate to category
                    },
                  ),
                const SizedBox(height: AppConstants.spacing),
                // Bottom card
                if (bottomIndex < genres.length)
                  CategoryCard(
                    title: genres[bottomIndex].name,
                    imageUrl: genres[bottomIndex].coverUrl,
                    onTap: () {
                      // TODO: Navigate to category
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
