/// Story model
class Story {
  final String id;
  final String title;
  final String authorId;
  final String authorName;
  final String summary;
  final String coverUrl;
  final List<String> genres;
  final int likes;
  final int views;
  final int chapters;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Story({
    required this.id,
    required this.title,
    required this.authorId,
    required this.authorName,
    required this.summary,
    required this.coverUrl,
    required this.genres,
    this.likes = 0,
    this.views = 0,
    this.chapters = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create Story from Supabase JSON
  factory Story.fromJson(Map<String, dynamic> json) {
    // Handle genres as either a list or a single string
    List<String> parseGenres(dynamic value) {
      if (value == null) return [];
      if (value is List) return value.cast<String>();
      if (value is String && value.isNotEmpty) return [value];
      return [];
    }

    return Story(
      id: json['id'] as String,
      title: json['title'] as String,
      authorId: json['author_id'] as String,
      authorName: json['author_name'] as String? ?? 'Unknown',
      summary: json['summary'] as String? ?? '',
      coverUrl: json['cover_url'] as String? ?? '',
      genres: parseGenres(json['genres'] ?? json['genre']),
      likes: json['likes'] as int? ?? 0,
      views: json['views'] as int? ?? 0,
      chapters: json['chapters'] as int? ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  /// Convert Story to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author_id': authorId,
      'author_name': authorName,
      'summary': summary,
      'cover_url': coverUrl,
      'genres': genres,
      'likes': likes,
      'views': views,
      'chapters': chapters,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// Copy with
  Story copyWith({
    String? id,
    String? title,
    String? authorId,
    String? authorName,
    String? summary,
    String? coverUrl,
    List<String>? genres,
    int? likes,
    int? views,
    int? chapters,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Story(
      id: id ?? this.id,
      title: title ?? this.title,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      summary: summary ?? this.summary,
      coverUrl: coverUrl ?? this.coverUrl,
      genres: genres ?? this.genres,
      likes: likes ?? this.likes,
      views: views ?? this.views,
      chapters: chapters ?? this.chapters,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Story && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
