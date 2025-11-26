import 'package:freezed_annotation/freezed_annotation.dart';

import 'genre.dart';

part 'story_details.freezed.dart';
part 'story_details.g.dart';

@freezed
abstract class StoryDetails with _$StoryDetails {
  const factory StoryDetails({
    @JsonKey(name: 'root_chapter_id') required String rootChapterId,
    @JsonKey(name: 'cover_url') String? coverUrl,
    String? summary,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    // Computed fields (calculated via SQL aggregation)
    @JsonKey(name: 'total_likes') @Default(0) int totalLikes,
    @JsonKey(name: 'total_views') @Default(0) int totalViews,
    @JsonKey(name: 'total_chapters') @Default(0) int totalChapters,
    // Joined data
    @Default([]) List<Genre> genres,
    @JsonKey(name: 'author_id') @Default('') String authorId,
    @JsonKey(name: 'author_name') @Default('Unknown') String authorName,
    @Default('') String title,
  }) = _StoryDetails;

  factory StoryDetails.fromJson(Map<String, dynamic> json) =>
      _$StoryDetailsFromJson(json);
}
