import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/story/genre.dart';
import '../../models/story/story_details.dart';

part 'discover_provider.g.dart';

/// State for trending stories
/// Keeps data in memory to avoid reloading on each visit to Discover
@Riverpod(keepAlive: true)
class TrendingStories extends _$TrendingStories {
  @override
  List<StoryDetails> build() {
    // Initialize with mock data for now
    return _mockTrendingStories;
  }
}

/// State for recent stories
/// Keeps data in memory to avoid reloading on each visit to Discover
@Riverpod(keepAlive: true)
class RecentStories extends _$RecentStories {
  @override
  List<StoryDetails> build() {
    // Initialize with mock data for now
    return _mockRecentStories;
  }
}

// ============================================================================
// Mock Data
// ============================================================================

final _mockTrendingStories = [
  StoryDetails(
    rootChapterId: 'trending-1',
    title: 'Le Royaume des Ombres',
    authorId: 'author-1',
    authorName: 'Marie Dubois',
    summary: 'Dans un monde où les ombres prennent vie à la tombée de la nuit, une jeune princesse découvre qu\'elle possède le pouvoir de les contrôler. Mais ce don attire l\'attention de forces obscures qui menacent de plonger le royaume dans les ténèbres éternelles.',
    coverUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400',
    genres: [
      Genre(id: 'g1', name: 'Fantaisie', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g2', name: 'Aventure', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g3', name: 'Magie', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g4', name: 'Épique', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g5', name: 'Sombre', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g6', name: 'Royauté', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g7', name: 'Pouvoir', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g8', name: 'Mystère', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g9', name: 'Action', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g10', name: 'Drame', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 15420,
    totalViews: 89300,
    totalChapters: 24,
    createdAt: DateTime(2024, 3, 15),
    updatedAt: DateTime(2024, 11, 20),
  ),
  StoryDetails(
    rootChapterId: 'trending-2',
    title: 'Étoiles Perdues',
    authorId: 'author-2',
    authorName: 'Lucas Martin',
    summary: 'En 2347, l\'humanité a colonisé les étoiles. Quand un signal mystérieux émerge d\'une galaxie lointaine, l\'équipage du vaisseau Odyssée se lance dans un voyage qui remettra en question tout ce qu\'ils croyaient savoir sur l\'univers.',
    coverUrl: 'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=400',
    genres: [
      Genre(id: 'g11', name: 'Science-Fiction', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g12', name: 'Aventure', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g13', name: 'Mystère', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 12800,
    totalViews: 67500,
    totalChapters: 18,
    createdAt: DateTime(2024, 5, 8),
    updatedAt: DateTime(2024, 11, 18),
  ),
  StoryDetails(
    rootChapterId: 'trending-3',
    title: 'Le Dernier Souffle',
    authorId: 'author-3',
    authorName: 'Sophie Laurent',
    summary: 'Un détective retraité reçoit une lettre anonyme qui le replonge dans l\'affaire non résolue qui a hanté toute sa carrière. Cette fois, il est déterminé à découvrir la vérité, même si elle pourrait tout détruire.',
    coverUrl: 'https://images.unsplash.com/photo-1509248961895-e00847860110?w=400',
    genres: [
      Genre(id: 'g14', name: 'Mystère', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g15', name: 'Thriller', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g16', name: 'Drame', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 9750,
    totalViews: 45200,
    totalChapters: 12,
    createdAt: DateTime(2024, 6, 22),
    updatedAt: DateTime(2024, 11, 15),
  ),
  StoryDetails(
    rootChapterId: 'trending-4',
    title: 'Amour Interdit',
    authorId: 'author-4',
    authorName: 'Emma Bernard',
    summary: 'Dans la Paris des années 1920, une jeune couturière tombe amoureuse d\'un aristocrate promis à une autre. Leur passion défie les conventions sociales dans une époque où l\'amour n\'a pas sa place dans les mariages arrangés.',
    coverUrl: 'https://images.unsplash.com/photo-1474552226712-ac0f0961a954?w=400',
    genres: [
      Genre(id: 'g17', name: 'Romance', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g18', name: 'Historique', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g19', name: 'Drame', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 8900,
    totalViews: 38600,
    totalChapters: 31,
    createdAt: DateTime(2024, 2, 14),
    updatedAt: DateTime(2024, 11, 22),
  ),
  StoryDetails(
    rootChapterId: 'trending-5',
    title: 'La Prophétie Oubliée',
    authorId: 'author-5',
    authorName: 'Thomas Petit',
    summary: 'Cinq héros aux destins liés doivent retrouver les fragments d\'une prophétie ancienne avant que le Destructeur ne s\'éveille. Une aventure épique à travers des terres inexplorées et des dangers mortels.',
    coverUrl: 'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=400',
    genres: [
      Genre(id: 'g20', name: 'Aventure', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g21', name: 'Fantaisie', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g22', name: 'Action', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 7200,
    totalViews: 29800,
    totalChapters: 15,
    createdAt: DateTime(2024, 7, 1),
    updatedAt: DateTime(2024, 11, 10),
  ),
];

final _mockRecentStories = [
  StoryDetails(
    rootChapterId: 'recent-1',
    title: 'Les Chroniques de l\'Aube',
    authorId: 'author-6',
    authorName: 'Claire Moreau',
    summary: 'Chaque matin, le monde se réinitialise. Seule Léa se souvient du jour précédent. Elle doit découvrir pourquoi avant que le cycle ne se brise définitivement.',
    coverUrl: 'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=400',
    genres: [
      Genre(id: 'g23', name: 'Fantaisie', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g24', name: 'Mystère', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 234,
    totalViews: 1250,
    totalChapters: 3,
    createdAt: DateTime(2024, 11, 20),
    updatedAt: DateTime(2024, 11, 24),
  ),
  StoryDetails(
    rootChapterId: 'recent-2',
    title: 'Murmures dans la Nuit',
    authorId: 'author-7',
    authorName: 'Antoine Roux',
    summary: 'Une maison abandonnée. Des voix qui appellent. Un journaliste qui refuse de croire aux fantômes... jusqu\'à ce qu\'il n\'ait plus le choix.',
    coverUrl: 'https://images.unsplash.com/photo-1509557965875-b88c97052f0e?w=400',
    genres: [
      Genre(id: 'g25', name: 'Horreur', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g26', name: 'Suspense', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 189,
    totalViews: 890,
    totalChapters: 5,
    createdAt: DateTime(2024, 11, 18),
    updatedAt: DateTime(2024, 11, 23),
  ),
  StoryDetails(
    rootChapterId: 'recent-3',
    title: 'Le Pacte des Éléments',
    authorId: 'author-8',
    authorName: 'Julie Blanc',
    summary: 'Quatre adolescents découvrent qu\'ils peuvent contrôler les éléments. Mais ce pouvoir a un prix, et quelqu\'un est prêt à tout pour le leur arracher.',
    coverUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400',
    genres: [
      Genre(id: 'g27', name: 'Fantaisie', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g28', name: 'Young Adult', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g29', name: 'Action', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 156,
    totalViews: 720,
    totalChapters: 2,
    createdAt: DateTime(2024, 11, 15),
    updatedAt: DateTime(2024, 11, 22),
  ),
  StoryDetails(
    rootChapterId: 'recent-4',
    title: 'Secrets de Famille',
    authorId: 'author-9',
    authorName: 'Marc Dupont',
    summary: 'À la mort de sa grand-mère, Camille découvre une boîte de lettres qui révèle un secret gardé pendant trois générations.',
    coverUrl: 'https://images.unsplash.com/photo-1527224857830-43a7acc85260?w=400',
    genres: [
      Genre(id: 'g30', name: 'Drame', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g31', name: 'Famille', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 98,
    totalViews: 456,
    totalChapters: 4,
    createdAt: DateTime(2024, 11, 12),
    updatedAt: DateTime(2024, 11, 21),
  ),
  StoryDetails(
    rootChapterId: 'recent-5',
    title: 'L\'Héritage du Dragon',
    authorId: 'author-10',
    authorName: 'Nicolas Leroy',
    summary: 'Le dernier descendant d\'une lignée de chasseurs de dragons découvre que son héritage n\'est pas ce qu\'il croyait.',
    coverUrl: 'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=400',
    genres: [
      Genre(id: 'g32', name: 'Aventure', createdAt: DateTime(2024, 1, 1)),
      Genre(id: 'g33', name: 'Fantaisie', createdAt: DateTime(2024, 1, 1)),
    ],
    totalLikes: 67,
    totalViews: 312,
    totalChapters: 1,
    createdAt: DateTime(2024, 11, 10),
    updatedAt: DateTime(2024, 11, 10),
  ),
];
