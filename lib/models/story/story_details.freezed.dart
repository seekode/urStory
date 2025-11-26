// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoryDetails {

@JsonKey(name: 'root_chapter_id') String get rootChapterId;@JsonKey(name: 'cover_url') String? get coverUrl; String? get summary;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;// Computed fields (calculated via SQL aggregation)
@JsonKey(name: 'total_likes') int get totalLikes;@JsonKey(name: 'total_views') int get totalViews;@JsonKey(name: 'total_chapters') int get totalChapters;// Joined data
 List<Genre> get genres;@JsonKey(name: 'author_id') String get authorId;@JsonKey(name: 'author_name') String get authorName; String get title;
/// Create a copy of StoryDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryDetailsCopyWith<StoryDetails> get copyWith => _$StoryDetailsCopyWithImpl<StoryDetails>(this as StoryDetails, _$identity);

  /// Serializes this StoryDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryDetails&&(identical(other.rootChapterId, rootChapterId) || other.rootChapterId == rootChapterId)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.totalLikes, totalLikes) || other.totalLikes == totalLikes)&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalChapters, totalChapters) || other.totalChapters == totalChapters)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rootChapterId,coverUrl,summary,createdAt,updatedAt,totalLikes,totalViews,totalChapters,const DeepCollectionEquality().hash(genres),authorId,authorName,title);

@override
String toString() {
  return 'StoryDetails(rootChapterId: $rootChapterId, coverUrl: $coverUrl, summary: $summary, createdAt: $createdAt, updatedAt: $updatedAt, totalLikes: $totalLikes, totalViews: $totalViews, totalChapters: $totalChapters, genres: $genres, authorId: $authorId, authorName: $authorName, title: $title)';
}


}

/// @nodoc
abstract mixin class $StoryDetailsCopyWith<$Res>  {
  factory $StoryDetailsCopyWith(StoryDetails value, $Res Function(StoryDetails) _then) = _$StoryDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'root_chapter_id') String rootChapterId,@JsonKey(name: 'cover_url') String? coverUrl, String? summary,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'total_likes') int totalLikes,@JsonKey(name: 'total_views') int totalViews,@JsonKey(name: 'total_chapters') int totalChapters, List<Genre> genres,@JsonKey(name: 'author_id') String authorId,@JsonKey(name: 'author_name') String authorName, String title
});




}
/// @nodoc
class _$StoryDetailsCopyWithImpl<$Res>
    implements $StoryDetailsCopyWith<$Res> {
  _$StoryDetailsCopyWithImpl(this._self, this._then);

  final StoryDetails _self;
  final $Res Function(StoryDetails) _then;

/// Create a copy of StoryDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rootChapterId = null,Object? coverUrl = freezed,Object? summary = freezed,Object? createdAt = null,Object? updatedAt = null,Object? totalLikes = null,Object? totalViews = null,Object? totalChapters = null,Object? genres = null,Object? authorId = null,Object? authorName = null,Object? title = null,}) {
  return _then(_self.copyWith(
rootChapterId: null == rootChapterId ? _self.rootChapterId : rootChapterId // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalLikes: null == totalLikes ? _self.totalLikes : totalLikes // ignore: cast_nullable_to_non_nullable
as int,totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalChapters: null == totalChapters ? _self.totalChapters : totalChapters // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryDetails].
extension StoryDetailsPatterns on StoryDetails {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryDetails() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryDetails value)  $default,){
final _that = this;
switch (_that) {
case _StoryDetails():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryDetails value)?  $default,){
final _that = this;
switch (_that) {
case _StoryDetails() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'root_chapter_id')  String rootChapterId, @JsonKey(name: 'cover_url')  String? coverUrl,  String? summary, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'total_likes')  int totalLikes, @JsonKey(name: 'total_views')  int totalViews, @JsonKey(name: 'total_chapters')  int totalChapters,  List<Genre> genres, @JsonKey(name: 'author_id')  String authorId, @JsonKey(name: 'author_name')  String authorName,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryDetails() when $default != null:
return $default(_that.rootChapterId,_that.coverUrl,_that.summary,_that.createdAt,_that.updatedAt,_that.totalLikes,_that.totalViews,_that.totalChapters,_that.genres,_that.authorId,_that.authorName,_that.title);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'root_chapter_id')  String rootChapterId, @JsonKey(name: 'cover_url')  String? coverUrl,  String? summary, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'total_likes')  int totalLikes, @JsonKey(name: 'total_views')  int totalViews, @JsonKey(name: 'total_chapters')  int totalChapters,  List<Genre> genres, @JsonKey(name: 'author_id')  String authorId, @JsonKey(name: 'author_name')  String authorName,  String title)  $default,) {final _that = this;
switch (_that) {
case _StoryDetails():
return $default(_that.rootChapterId,_that.coverUrl,_that.summary,_that.createdAt,_that.updatedAt,_that.totalLikes,_that.totalViews,_that.totalChapters,_that.genres,_that.authorId,_that.authorName,_that.title);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'root_chapter_id')  String rootChapterId, @JsonKey(name: 'cover_url')  String? coverUrl,  String? summary, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'total_likes')  int totalLikes, @JsonKey(name: 'total_views')  int totalViews, @JsonKey(name: 'total_chapters')  int totalChapters,  List<Genre> genres, @JsonKey(name: 'author_id')  String authorId, @JsonKey(name: 'author_name')  String authorName,  String title)?  $default,) {final _that = this;
switch (_that) {
case _StoryDetails() when $default != null:
return $default(_that.rootChapterId,_that.coverUrl,_that.summary,_that.createdAt,_that.updatedAt,_that.totalLikes,_that.totalViews,_that.totalChapters,_that.genres,_that.authorId,_that.authorName,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoryDetails implements StoryDetails {
  const _StoryDetails({@JsonKey(name: 'root_chapter_id') required this.rootChapterId, @JsonKey(name: 'cover_url') this.coverUrl, this.summary, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'total_likes') this.totalLikes = 0, @JsonKey(name: 'total_views') this.totalViews = 0, @JsonKey(name: 'total_chapters') this.totalChapters = 0, final  List<Genre> genres = const [], @JsonKey(name: 'author_id') this.authorId = '', @JsonKey(name: 'author_name') this.authorName = 'Unknown', this.title = ''}): _genres = genres;
  factory _StoryDetails.fromJson(Map<String, dynamic> json) => _$StoryDetailsFromJson(json);

@override@JsonKey(name: 'root_chapter_id') final  String rootChapterId;
@override@JsonKey(name: 'cover_url') final  String? coverUrl;
@override final  String? summary;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
// Computed fields (calculated via SQL aggregation)
@override@JsonKey(name: 'total_likes') final  int totalLikes;
@override@JsonKey(name: 'total_views') final  int totalViews;
@override@JsonKey(name: 'total_chapters') final  int totalChapters;
// Joined data
 final  List<Genre> _genres;
// Joined data
@override@JsonKey() List<Genre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override@JsonKey(name: 'author_id') final  String authorId;
@override@JsonKey(name: 'author_name') final  String authorName;
@override@JsonKey() final  String title;

/// Create a copy of StoryDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryDetailsCopyWith<_StoryDetails> get copyWith => __$StoryDetailsCopyWithImpl<_StoryDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryDetails&&(identical(other.rootChapterId, rootChapterId) || other.rootChapterId == rootChapterId)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.totalLikes, totalLikes) || other.totalLikes == totalLikes)&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalChapters, totalChapters) || other.totalChapters == totalChapters)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rootChapterId,coverUrl,summary,createdAt,updatedAt,totalLikes,totalViews,totalChapters,const DeepCollectionEquality().hash(_genres),authorId,authorName,title);

@override
String toString() {
  return 'StoryDetails(rootChapterId: $rootChapterId, coverUrl: $coverUrl, summary: $summary, createdAt: $createdAt, updatedAt: $updatedAt, totalLikes: $totalLikes, totalViews: $totalViews, totalChapters: $totalChapters, genres: $genres, authorId: $authorId, authorName: $authorName, title: $title)';
}


}

/// @nodoc
abstract mixin class _$StoryDetailsCopyWith<$Res> implements $StoryDetailsCopyWith<$Res> {
  factory _$StoryDetailsCopyWith(_StoryDetails value, $Res Function(_StoryDetails) _then) = __$StoryDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'root_chapter_id') String rootChapterId,@JsonKey(name: 'cover_url') String? coverUrl, String? summary,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'total_likes') int totalLikes,@JsonKey(name: 'total_views') int totalViews,@JsonKey(name: 'total_chapters') int totalChapters, List<Genre> genres,@JsonKey(name: 'author_id') String authorId,@JsonKey(name: 'author_name') String authorName, String title
});




}
/// @nodoc
class __$StoryDetailsCopyWithImpl<$Res>
    implements _$StoryDetailsCopyWith<$Res> {
  __$StoryDetailsCopyWithImpl(this._self, this._then);

  final _StoryDetails _self;
  final $Res Function(_StoryDetails) _then;

/// Create a copy of StoryDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rootChapterId = null,Object? coverUrl = freezed,Object? summary = freezed,Object? createdAt = null,Object? updatedAt = null,Object? totalLikes = null,Object? totalViews = null,Object? totalChapters = null,Object? genres = null,Object? authorId = null,Object? authorName = null,Object? title = null,}) {
  return _then(_StoryDetails(
rootChapterId: null == rootChapterId ? _self.rootChapterId : rootChapterId // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalLikes: null == totalLikes ? _self.totalLikes : totalLikes // ignore: cast_nullable_to_non_nullable
as int,totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalChapters: null == totalChapters ? _self.totalChapters : totalChapters // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
