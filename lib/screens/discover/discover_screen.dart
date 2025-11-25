import 'package:flutter/material.dart';
import '../../core/router/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_constants.dart';
import '../../core/widgets/story/story_card.dart';
import '../../core/widgets/story/story_card_trending.dart';
import '../../models/story.dart';
import 'widgets/category_card.dart';
import 'widgets/section_header.dart';

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
            // App title
            SliverToBoxAdapter(
              child: Padding(
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
            ),

            // Categories section
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Catégories',
                onSeeMore: () {
                  // TODO: Navigate to all categories
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppConstants.spacingMd),
            ),
            SliverToBoxAdapter(
              child: _CategoriesSection(),
            ),

            // Spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: AppConstants.spacingXl),
            ),

            // Trending section
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'En tendance',
                onSeeMore: () {
                  // TODO: Navigate to all trending
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppConstants.spacingMd),
            ),
            SliverToBoxAdapter(
              child: _TrendingSection(),
            ),

            // Spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: AppConstants.spacingXl),
            ),

            // Recent stories section
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Récemment ajoutées',
                onSeeMore: () {
                  // TODO: Navigate to all recent
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppConstants.spacingMd),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.marginMobile,
              ),
              sliver: _RecentStoriesSection(),
            ),

            // Bottom padding for navbar
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }
}

/// Categories horizontal scrollable grid (2 rows)
class _CategoriesSection extends StatelessWidget {
  // Mock data
  static const _mockCategories = [
    {
      'title': 'Fantaisie',
      'image': 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400',
    },
    {
      'title': 'Romance',
      'image': 'https://images.unsplash.com/photo-1474552226712-ac0f0961a954?w=400',
    },
    {
      'title': 'Science-Fiction',
      'image': 'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=400',
    },
    {
      'title': 'Mystère',
      'image': 'https://images.unsplash.com/photo-1509248961895-e00847860110?w=400',
    },
    {
      'title': 'Horreur',
      'image': 'https://images.unsplash.com/photo-1509557965875-b88c97052f0e?w=400',
    },
    {
      'title': 'Aventure',
      'image': 'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=400',
    },
    {
      'title': 'Drame',
      'image': 'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=400',
    },
    {
      'title': 'Comédie',
      'image': 'https://images.unsplash.com/photo-1527224857830-43a7acc85260?w=400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 176, // 2 cards (80px each) + spacing (16px)
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.marginMobile,
        ),
        itemCount: (_mockCategories.length / 2).ceil(),
        itemBuilder: (context, columnIndex) {
          final topIndex = columnIndex * 2;
          final bottomIndex = topIndex + 1;

          return Padding(
            padding: EdgeInsets.only(
              right: columnIndex < (_mockCategories.length / 2).ceil() - 1
                  ? AppConstants.spacingMd
                  : 0,
            ),
            child: Column(
              children: [
                // Top card
                if (topIndex < _mockCategories.length)
                  CategoryCard(
                    title: _mockCategories[topIndex]['title']!,
                    imageUrl: _mockCategories[topIndex]['image']!,
                    onTap: () {
                      // TODO: Navigate to category
                    },
                  ),
                const SizedBox(height: AppConstants.spacing),
                // Bottom card
                if (bottomIndex < _mockCategories.length)
                  CategoryCard(
                    title: _mockCategories[bottomIndex]['title']!,
                    imageUrl: _mockCategories[bottomIndex]['image']!,
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

/// Trending stories horizontal list
class _TrendingSection extends StatelessWidget {
  // Mock data as Story objects
  static final _mockTrendingStories = [
    Story(
      id: 'trending-1',
      title: 'Le Royaume des Ombres',
      authorId: 'author-1',
      authorName: 'Marie Dubois',
      summary: 'Dans un monde où les ombres prennent vie à la tombée de la nuit, une jeune princesse découvre qu\'elle possède le pouvoir de les contrôler. Mais ce don attire l\'attention de forces obscures qui menacent de plonger le royaume dans les ténèbres éternelles.',
      coverUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400',
      genres: ['Fantaisie', 'Aventure', 'Magie', 'Épique', 'Sombre', 'Royauté', 'Pouvoir', 'Mystère', 'Action', 'Drame'],
      likes: 15420,
      views: 89300,
      chapters: 24,
      createdAt: DateTime(2024, 3, 15),
      updatedAt: DateTime(2024, 11, 20),
    ),
    Story(
      id: 'trending-2',
      title: 'Étoiles Perdues',
      authorId: 'author-2',
      authorName: 'Lucas Martin',
      summary: 'En 2347, l\'humanité a colonisé les étoiles. Quand un signal mystérieux émerge d\'une galaxie lointaine, l\'équipage du vaisseau Odyssée se lance dans un voyage qui remettra en question tout ce qu\'ils croyaient savoir sur l\'univers.',
      coverUrl: 'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=400',
      genres: ['Science-Fiction', 'Aventure', 'Mystère'],
      likes: 12800,
      views: 67500,
      chapters: 18,
      createdAt: DateTime(2024, 5, 8),
      updatedAt: DateTime(2024, 11, 18),
    ),
    Story(
      id: 'trending-3',
      title: 'Le Dernier Souffle',
      authorId: 'author-3',
      authorName: 'Sophie Laurent',
      summary: 'Un détective retraité reçoit une lettre anonyme qui le replonge dans l\'affaire non résolue qui a hanté toute sa carrière. Cette fois, il est déterminé à découvrir la vérité, même si elle pourrait tout détruire.',
      coverUrl: 'https://images.unsplash.com/photo-1509248961895-e00847860110?w=400',
      genres: ['Mystère', 'Thriller', 'Drame'],
      likes: 9750,
      views: 45200,
      chapters: 12,
      createdAt: DateTime(2024, 6, 22),
      updatedAt: DateTime(2024, 11, 15),
    ),
    Story(
      id: 'trending-4',
      title: 'Amour Interdit',
      authorId: 'author-4',
      authorName: 'Emma Bernard',
      summary: 'Dans la Paris des années 1920, une jeune couturière tombe amoureuse d\'un aristocrate promis à une autre. Leur passion défie les conventions sociales dans une époque où l\'amour n\'a pas sa place dans les mariages arrangés.',
      coverUrl: 'https://images.unsplash.com/photo-1474552226712-ac0f0961a954?w=400',
      genres: ['Romance', 'Historique', 'Drame'],
      likes: 8900,
      views: 38600,
      chapters: 31,
      createdAt: DateTime(2024, 2, 14),
      updatedAt: DateTime(2024, 11, 22),
    ),
    Story(
      id: 'trending-5',
      title: 'La Prophétie Oubliée',
      authorId: 'author-5',
      authorName: 'Thomas Petit',
      summary: 'Cinq héros aux destins liés doivent retrouver les fragments d\'une prophétie ancienne avant que le Destructeur ne s\'éveille. Une aventure épique à travers des terres inexplorées et des dangers mortels.',
      coverUrl: 'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=400',
      genres: ['Aventure', 'Fantaisie', 'Action'],
      likes: 7200,
      views: 29800,
      chapters: 15,
      createdAt: DateTime(2024, 7, 1),
      updatedAt: DateTime(2024, 11, 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.marginMobile,
        ),
        itemCount: _mockTrendingStories.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: AppConstants.spacingMd,
        ),
        itemBuilder: (context, index) {
          final story = _mockTrendingStories[index];
          return StoryCardTrending(
            title: story.title,
            coverUrl: story.coverUrl,
            likes: story.likes,
            reads: story.views,
            chapters: story.chapters,
            onTap: () => router.push(AppRoutes.storyDetail, extra: story),
          );
        },
      ),
    );
  }
}

/// Recent stories vertical list
class _RecentStoriesSection extends StatelessWidget {
  // Mock data as Story objects
  static final _mockRecentStories = [
    Story(
      id: 'recent-1',
      title: 'Les Chroniques de l\'Aube',
      authorId: 'author-6',
      authorName: 'Claire Moreau',
      summary: 'Chaque matin, le monde se réinitialise. Seule Léa se souvient du jour précédent. Elle doit découvrir pourquoi avant que le cycle ne se brise définitivement.',
      coverUrl: 'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=400',
      genres: ['Fantaisie', 'Mystère'],
      likes: 234,
      views: 1250,
      chapters: 3,
      createdAt: DateTime(2024, 11, 20),
      updatedAt: DateTime(2024, 11, 24),
    ),
    Story(
      id: 'recent-2',
      title: 'Murmures dans la Nuit',
      authorId: 'author-7',
      authorName: 'Antoine Roux',
      summary: 'Une maison abandonnée. Des voix qui appellent. Un journaliste qui refuse de croire aux fantômes... jusqu\'à ce qu\'il n\'ait plus le choix.',
      coverUrl: 'https://images.unsplash.com/photo-1509557965875-b88c97052f0e?w=400',
      genres: ['Horreur', 'Suspense'],
      likes: 189,
      views: 890,
      chapters: 5,
      createdAt: DateTime(2024, 11, 18),
      updatedAt: DateTime(2024, 11, 23),
    ),
    Story(
      id: 'recent-3',
      title: 'Le Pacte des Éléments',
      authorId: 'author-8',
      authorName: 'Julie Blanc',
      summary: 'Quatre adolescents découvrent qu\'ils peuvent contrôler les éléments. Mais ce pouvoir a un prix, et quelqu\'un est prêt à tout pour le leur arracher.',
      coverUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400',
      genres: ['Fantaisie', 'Young Adult', 'Action'],
      likes: 156,
      views: 720,
      chapters: 2,
      createdAt: DateTime(2024, 11, 15),
      updatedAt: DateTime(2024, 11, 22),
    ),
    Story(
      id: 'recent-4',
      title: 'Secrets de Famille',
      authorId: 'author-9',
      authorName: 'Marc Dupont',
      summary: 'À la mort de sa grand-mère, Camille découvre une boîte de lettres qui révèle un secret gardé pendant trois générations.',
      coverUrl: 'https://images.unsplash.com/photo-1527224857830-43a7acc85260?w=400',
      genres: ['Drame', 'Famille'],
      likes: 98,
      views: 456,
      chapters: 4,
      createdAt: DateTime(2024, 11, 12),
      updatedAt: DateTime(2024, 11, 21),
    ),
    Story(
      id: 'recent-5',
      title: 'L\'Héritage du Dragon',
      authorId: 'author-10',
      authorName: 'Nicolas Leroy',
      summary: 'Le dernier descendant d\'une lignée de chasseurs de dragons découvre que son héritage n\'est pas ce qu\'il croyait.',
      coverUrl: 'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=400',
      genres: ['Aventure', 'Fantaisie'],
      likes: 67,
      views: 312,
      chapters: 1,
      createdAt: DateTime(2024, 11, 10),
      updatedAt: DateTime(2024, 11, 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final story = _mockRecentStories[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < _mockRecentStories.length - 1
                  ? AppConstants.spacingMd
                  : 0,
            ),
            child: StoryCard(
              title: story.title,
              coverUrl: story.coverUrl,
              likes: story.likes,
              reads: story.views,
              chapters: story.chapters,
              onTap: () => router.push(AppRoutes.storyDetail, extra: story),
            ),
          );
        },
        childCount: _mockRecentStories.length,
      ),
    );
  }
}
