// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoryDetails _$StoryDetailsFromJson(Map<String, dynamic> json) =>
    _StoryDetails(
      rootChapterId: json['root_chapter_id'] as String,
      coverUrl: json['cover_url'] as String?,
      summary: json['summary'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      totalLikes: (json['total_likes'] as num?)?.toInt() ?? 0,
      totalViews: (json['total_views'] as num?)?.toInt() ?? 0,
      totalChapters: (json['total_chapters'] as num?)?.toInt() ?? 0,
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      authorId: json['author_id'] as String? ?? '',
      authorName: json['author_name'] as String? ?? 'Unknown',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$StoryDetailsToJson(_StoryDetails instance) =>
    <String, dynamic>{
      'root_chapter_id': instance.rootChapterId,
      'cover_url': instance.coverUrl,
      'summary': instance.summary,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'total_likes': instance.totalLikes,
      'total_views': instance.totalViews,
      'total_chapters': instance.totalChapters,
      'genres': instance.genres,
      'author_id': instance.authorId,
      'author_name': instance.authorName,
      'title': instance.title,
    };
