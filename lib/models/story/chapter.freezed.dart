// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chapter {

 String get id;@JsonKey(name: 'author_id') String get authorId;@JsonKey(name: 'parent_chapter_id') String? get parentChapterId;@JsonKey(name: 'root_chapter_id') String? get rootChapterId; String get title; String get content;@JsonKey(name: 'end_question') String? get endQuestion;@JsonKey(name: 'published_at') DateTime? get publishedAt;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'story_details') StoryDetails? get storyDetails;@JsonKey(name: 'author_name') String? get authorName;
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterCopyWith<Chapter> get copyWith => _$ChapterCopyWithImpl<Chapter>(this as Chapter, _$identity);

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.parentChapterId, parentChapterId) || other.parentChapterId == parentChapterId)&&(identical(other.rootChapterId, rootChapterId) || other.rootChapterId == rootChapterId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.endQuestion, endQuestion) || other.endQuestion == endQuestion)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.storyDetails, storyDetails) || other.storyDetails == storyDetails)&&(identical(other.authorName, authorName) || other.authorName == authorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorId,parentChapterId,rootChapterId,title,content,endQuestion,publishedAt,createdAt,storyDetails,authorName);

@override
String toString() {
  return 'Chapter(id: $id, authorId: $authorId, parentChapterId: $parentChapterId, rootChapterId: $rootChapterId, title: $title, content: $content, endQuestion: $endQuestion, publishedAt: $publishedAt, createdAt: $createdAt, storyDetails: $storyDetails, authorName: $authorName)';
}


}

/// @nodoc
abstract mixin class $ChapterCopyWith<$Res>  {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) _then) = _$ChapterCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'author_id') String authorId,@JsonKey(name: 'parent_chapter_id') String? parentChapterId,@JsonKey(name: 'root_chapter_id') String? rootChapterId, String title, String content,@JsonKey(name: 'end_question') String? endQuestion,@JsonKey(name: 'published_at') DateTime? publishedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'story_details') StoryDetails? storyDetails,@JsonKey(name: 'author_name') String? authorName
});


$StoryDetailsCopyWith<$Res>? get storyDetails;

}
/// @nodoc
class _$ChapterCopyWithImpl<$Res>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._self, this._then);

  final Chapter _self;
  final $Res Function(Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorId = null,Object? parentChapterId = freezed,Object? rootChapterId = freezed,Object? title = null,Object? content = null,Object? endQuestion = freezed,Object? publishedAt = freezed,Object? createdAt = null,Object? storyDetails = freezed,Object? authorName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,parentChapterId: freezed == parentChapterId ? _self.parentChapterId : parentChapterId // ignore: cast_nullable_to_non_nullable
as String?,rootChapterId: freezed == rootChapterId ? _self.rootChapterId : rootChapterId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,endQuestion: freezed == endQuestion ? _self.endQuestion : endQuestion // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,storyDetails: freezed == storyDetails ? _self.storyDetails : storyDetails // ignore: cast_nullable_to_non_nullable
as StoryDetails?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryDetailsCopyWith<$Res>? get storyDetails {
    if (_self.storyDetails == null) {
    return null;
  }

  return $StoryDetailsCopyWith<$Res>(_self.storyDetails!, (value) {
    return _then(_self.copyWith(storyDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [Chapter].
extension ChapterPatterns on Chapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chapter value)  $default,){
final _that = this;
switch (_that) {
case _Chapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chapter value)?  $default,){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'author_id')  String authorId, @JsonKey(name: 'parent_chapter_id')  String? parentChapterId, @JsonKey(name: 'root_chapter_id')  String? rootChapterId,  String title,  String content, @JsonKey(name: 'end_question')  String? endQuestion, @JsonKey(name: 'published_at')  DateTime? publishedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'story_details')  StoryDetails? storyDetails, @JsonKey(name: 'author_name')  String? authorName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.authorId,_that.parentChapterId,_that.rootChapterId,_that.title,_that.content,_that.endQuestion,_that.publishedAt,_that.createdAt,_that.storyDetails,_that.authorName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'author_id')  String authorId, @JsonKey(name: 'parent_chapter_id')  String? parentChapterId, @JsonKey(name: 'root_chapter_id')  String? rootChapterId,  String title,  String content, @JsonKey(name: 'end_question')  String? endQuestion, @JsonKey(name: 'published_at')  DateTime? publishedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'story_details')  StoryDetails? storyDetails, @JsonKey(name: 'author_name')  String? authorName)  $default,) {final _that = this;
switch (_that) {
case _Chapter():
return $default(_that.id,_that.authorId,_that.parentChapterId,_that.rootChapterId,_that.title,_that.content,_that.endQuestion,_that.publishedAt,_that.createdAt,_that.storyDetails,_that.authorName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'author_id')  String authorId, @JsonKey(name: 'parent_chapter_id')  String? parentChapterId, @JsonKey(name: 'root_chapter_id')  String? rootChapterId,  String title,  String content, @JsonKey(name: 'end_question')  String? endQuestion, @JsonKey(name: 'published_at')  DateTime? publishedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'story_details')  StoryDetails? storyDetails, @JsonKey(name: 'author_name')  String? authorName)?  $default,) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.authorId,_that.parentChapterId,_that.rootChapterId,_that.title,_that.content,_that.endQuestion,_that.publishedAt,_that.createdAt,_that.storyDetails,_that.authorName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chapter extends Chapter {
  const _Chapter({required this.id, @JsonKey(name: 'author_id') required this.authorId, @JsonKey(name: 'parent_chapter_id') this.parentChapterId, @JsonKey(name: 'root_chapter_id') this.rootChapterId, required this.title, required this.content, @JsonKey(name: 'end_question') this.endQuestion, @JsonKey(name: 'published_at') this.publishedAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'story_details') this.storyDetails, @JsonKey(name: 'author_name') this.authorName}): super._();
  factory _Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

@override final  String id;
@override@JsonKey(name: 'author_id') final  String authorId;
@override@JsonKey(name: 'parent_chapter_id') final  String? parentChapterId;
@override@JsonKey(name: 'root_chapter_id') final  String? rootChapterId;
@override final  String title;
@override final  String content;
@override@JsonKey(name: 'end_question') final  String? endQuestion;
@override@JsonKey(name: 'published_at') final  DateTime? publishedAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'story_details') final  StoryDetails? storyDetails;
@override@JsonKey(name: 'author_name') final  String? authorName;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterCopyWith<_Chapter> get copyWith => __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.parentChapterId, parentChapterId) || other.parentChapterId == parentChapterId)&&(identical(other.rootChapterId, rootChapterId) || other.rootChapterId == rootChapterId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.endQuestion, endQuestion) || other.endQuestion == endQuestion)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.storyDetails, storyDetails) || other.storyDetails == storyDetails)&&(identical(other.authorName, authorName) || other.authorName == authorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorId,parentChapterId,rootChapterId,title,content,endQuestion,publishedAt,createdAt,storyDetails,authorName);

@override
String toString() {
  return 'Chapter(id: $id, authorId: $authorId, parentChapterId: $parentChapterId, rootChapterId: $rootChapterId, title: $title, content: $content, endQuestion: $endQuestion, publishedAt: $publishedAt, createdAt: $createdAt, storyDetails: $storyDetails, authorName: $authorName)';
}


}

/// @nodoc
abstract mixin class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) _then) = __$ChapterCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'author_id') String authorId,@JsonKey(name: 'parent_chapter_id') String? parentChapterId,@JsonKey(name: 'root_chapter_id') String? rootChapterId, String title, String content,@JsonKey(name: 'end_question') String? endQuestion,@JsonKey(name: 'published_at') DateTime? publishedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'story_details') StoryDetails? storyDetails,@JsonKey(name: 'author_name') String? authorName
});


@override $StoryDetailsCopyWith<$Res>? get storyDetails;

}
/// @nodoc
class __$ChapterCopyWithImpl<$Res>
    implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(this._self, this._then);

  final _Chapter _self;
  final $Res Function(_Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorId = null,Object? parentChapterId = freezed,Object? rootChapterId = freezed,Object? title = null,Object? content = null,Object? endQuestion = freezed,Object? publishedAt = freezed,Object? createdAt = null,Object? storyDetails = freezed,Object? authorName = freezed,}) {
  return _then(_Chapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,parentChapterId: freezed == parentChapterId ? _self.parentChapterId : parentChapterId // ignore: cast_nullable_to_non_nullable
as String?,rootChapterId: freezed == rootChapterId ? _self.rootChapterId : rootChapterId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,endQuestion: freezed == endQuestion ? _self.endQuestion : endQuestion // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,storyDetails: freezed == storyDetails ? _self.storyDetails : storyDetails // ignore: cast_nullable_to_non_nullable
as StoryDetails?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryDetailsCopyWith<$Res>? get storyDetails {
    if (_self.storyDetails == null) {
    return null;
  }

  return $StoryDetailsCopyWith<$Res>(_self.storyDetails!, (value) {
    return _then(_self.copyWith(storyDetails: value));
  });
}
}

// dart format on
