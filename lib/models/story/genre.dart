import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
abstract class Genre with _$Genre {
  const factory Genre({
    required String id,
    required String name,
    @JsonKey(name: 'cover_url') String? coverUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
