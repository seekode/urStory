// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chapter _$ChapterFromJson(Map<String, dynamic> json) => _Chapter(
  id: json['id'] as String,
  authorId: json['author_id'] as String,
  parentChapterId: json['parent_chapter_id'] as String?,
  rootChapterId: json['root_chapter_id'] as String?,
  title: json['title'] as String,
  content: json['content'] as String,
  endQuestion: json['end_question'] as String?,
  publishedAt: json['published_at'] == null
      ? null
      : DateTime.parse(json['published_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  storyDetails: json['story_details'] == null
      ? null
      : StoryDetails.fromJson(json['story_details'] as Map<String, dynamic>),
  authorName: json['author_name'] as String?,
);

Map<String, dynamic> _$ChapterToJson(_Chapter instance) => <String, dynamic>{
  'id': instance.id,
  'author_id': instance.authorId,
  'parent_chapter_id': instance.parentChapterId,
  'root_chapter_id': instance.rootChapterId,
  'title': instance.title,
  'content': instance.content,
  'end_question': instance.endQuestion,
  'published_at': instance.publishedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'story_details': instance.storyDetails,
  'author_name': instance.authorName,
};
