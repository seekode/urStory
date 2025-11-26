import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/story/genre.dart';

part 'genre_provider.g.dart';

/// State for genres/categories
/// Keeps data in memory to avoid reloading on each visit to Discover
@Riverpod(keepAlive: true)
class GenresNotifier extends _$GenresNotifier {
  @override
  List<Genre> build() {
    // Initialize with mock data for now
    return _mockGenres;
  }
}

// Mock data for development
final _mockGenres = [
  Genre(
    id: 'genre-1',
    name: 'Fantaisie',
    coverUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400',
    createdAt: DateTime(2024, 1, 1),
  ),
  Genre(
    id: 'genre-2',
    name: 'Romance',
    coverUrl: 'https://images.unsplash.com/photo-1474552226712-ac0f0961a954?w=400',
    createdAt: DateTime(2024, 1, 1),
  ),
  Genre(
    id: 'genre-3',
    name: 'Science-Fiction',
    coverUrl: 'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=400',
    createdAt: DateTime(2024, 1, 1),
  ),
  Genre(
    id: 'genre-4',
    name: 'Mystère',
    coverUrl: 'https://images.unsplash.com/photo-1509248961895-e00847860110?w=400',
    createdAt: DateTime(2024, 1, 1),
  ),
  Genre(
    id: 'genre-5',
    name: 'Horreur',
    coverUrl: 'https://images.unsplash.com/photo-1509557965875-b88c97052f0e?w=400',
    createdAt: DateTime(2024, 1, 1),
  ),
  Genre(
    id: 'genre-6',
    name: 'Aventure',
    coverUrl: 'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=400',
    createdAt: DateTime(2024, 1, 1),
  ),
  Genre(
    id: 'genre-7',
    name: 'Drame',
    coverUrl: 'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=400',
    createdAt: DateTime(2024, 1, 1),
  ),
  Genre(
    id: 'genre-8',
    name: 'Comédie',
    coverUrl: 'https://images.unsplash.com/photo-1527224857830-43a7acc85260?w=400',
    createdAt: DateTime(2024, 1, 1),
  ),
];
