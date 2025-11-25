import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/story.dart';
import '../services/story_service.dart';
import 'supabase_provider.dart';

part 'story_provider.g.dart';

/// Story service provider
@riverpod
StoryService storyService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return StoryService(client);
}

/// Get story by ID
@riverpod
Future<Story?> storyById(Ref ref, String id) async {
  final service = ref.watch(storyServiceProvider);
  return service.getStoryById(id);
}

/// Get trending stories
@riverpod
Future<List<Story>> trendingStories(Ref ref) async {
  final service = ref.watch(storyServiceProvider);
  return service.getTrendingStories();
}

/// Get recent stories
@riverpod
Future<List<Story>> recentStories(Ref ref) async {
  final service = ref.watch(storyServiceProvider);
  return service.getRecentStories();
}
