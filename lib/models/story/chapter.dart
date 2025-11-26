import 'package:freezed_annotation/freezed_annotation.dart';

import 'story_details.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
abstract class Chapter with _$Chapter {
  const Chapter._();

  const factory Chapter({
    required String id,
    @JsonKey(name: 'author_id') required String authorId,
    @JsonKey(name: 'parent_chapter_id') String? parentChapterId,
    @JsonKey(name: 'root_chapter_id') String? rootChapterId,
    required String title,
    required String content,
    @JsonKey(name: 'end_question') String? endQuestion,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'story_details') StoryDetails? storyDetails,
    @JsonKey(name: 'author_name') String? authorName,
  }) = _Chapter;

  /// Check if this is a root chapter (first chapter of a story)
  bool get isRootChapter => rootChapterId == null;

  /// Get the effective root chapter ID (self if root, otherwise rootChapterId)
  String get effectiveRootChapterId => rootChapterId ?? id;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}
