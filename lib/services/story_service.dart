import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../models/story.dart';

/// Story service - Handles all story-related Supabase operations
class StoryService {
  final supabase.SupabaseClient _client;

  StoryService(this._client);

  /// Get a story by ID
  Future<Story?> getStoryById(String id) async {
    try {
      final data = await _client
          .from('stories')
          .select()
          .eq('id', id)
          .single();

      return Story.fromJson(data);
    } catch (e) {
      return null;
    }
  }

  /// Get trending stories (by views)
  Future<List<Story>> getTrendingStories({int limit = 10}) async {
    try {
      final data = await _client
          .from('stories')
          .select()
          .order('views', ascending: false)
          .limit(limit);

      return (data as List).map((json) => Story.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  /// Get recent stories
  Future<List<Story>> getRecentStories({int limit = 10}) async {
    try {
      final data = await _client
          .from('stories')
          .select()
          .order('created_at', ascending: false)
          .limit(limit);

      return (data as List).map((json) => Story.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  /// Get stories by genre
  Future<List<Story>> getStoriesByGenre(String genre, {int limit = 20}) async {
    try {
      final data = await _client
          .from('stories')
          .select()
          .eq('genre', genre)
          .order('created_at', ascending: false)
          .limit(limit);

      return (data as List).map((json) => Story.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  /// Increment view count
  Future<void> incrementViews(String storyId) async {
    try {
      await _client.rpc('increment_story_views', params: {'story_id': storyId});
    } catch (e) {
      // Silently fail - views are not critical
    }
  }

  /// Toggle like on a story
  Future<bool> toggleLike(String storyId, String userId) async {
    try {
      // Check if already liked
      final existing = await _client
          .from('story_likes')
          .select()
          .eq('story_id', storyId)
          .eq('user_id', userId)
          .maybeSingle();

      if (existing != null) {
        // Unlike
        await _client
            .from('story_likes')
            .delete()
            .eq('story_id', storyId)
            .eq('user_id', userId);
        return false;
      } else {
        // Like
        await _client.from('story_likes').insert({
          'story_id': storyId,
          'user_id': userId,
        });
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Check if user has liked a story
  Future<bool> isLiked(String storyId, String userId) async {
    try {
      final data = await _client
          .from('story_likes')
          .select()
          .eq('story_id', storyId)
          .eq('user_id', userId)
          .maybeSingle();

      return data != null;
    } catch (e) {
      return false;
    }
  }

  /// Add story to favorites
  Future<void> addToFavorites(String storyId, String userId) async {
    try {
      await _client.from('favorites').insert({
        'story_id': storyId,
        'user_id': userId,
      });
    } catch (e) {
      rethrow;
    }
  }

  /// Remove story from favorites
  Future<void> removeFromFavorites(String storyId, String userId) async {
    try {
      await _client
          .from('favorites')
          .delete()
          .eq('story_id', storyId)
          .eq('user_id', userId);
    } catch (e) {
      rethrow;
    }
  }

  /// Check if story is in favorites
  Future<bool> isFavorite(String storyId, String userId) async {
    try {
      final data = await _client
          .from('favorites')
          .select()
          .eq('story_id', storyId)
          .eq('user_id', userId)
          .maybeSingle();

      return data != null;
    } catch (e) {
      return false;
    }
  }
}
