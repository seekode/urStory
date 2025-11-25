// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Story service provider

@ProviderFor(storyService)
const storyServiceProvider = StoryServiceProvider._();

/// Story service provider

final class StoryServiceProvider
    extends $FunctionalProvider<StoryService, StoryService, StoryService>
    with $Provider<StoryService> {
  /// Story service provider
  const StoryServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storyServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storyServiceHash();

  @$internal
  @override
  $ProviderElement<StoryService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StoryService create(Ref ref) {
    return storyService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoryService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoryService>(value),
    );
  }
}

String _$storyServiceHash() => r'c1c74a6cefd2af5dccbd9f66b325ba90e24953be';

/// Get story by ID

@ProviderFor(storyById)
const storyByIdProvider = StoryByIdFamily._();

/// Get story by ID

final class StoryByIdProvider
    extends $FunctionalProvider<AsyncValue<Story?>, Story?, FutureOr<Story?>>
    with $FutureModifier<Story?>, $FutureProvider<Story?> {
  /// Get story by ID
  const StoryByIdProvider._({
    required StoryByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'storyByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storyByIdHash();

  @override
  String toString() {
    return r'storyByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Story?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Story?> create(Ref ref) {
    final argument = this.argument as String;
    return storyById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StoryByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storyByIdHash() => r'0ece682524dbd29c7c4d1c344465c1997faf3fb3';

/// Get story by ID

final class StoryByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Story?>, String> {
  const StoryByIdFamily._()
    : super(
        retry: null,
        name: r'storyByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Get story by ID

  StoryByIdProvider call(String id) =>
      StoryByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'storyByIdProvider';
}

/// Get trending stories

@ProviderFor(trendingStories)
const trendingStoriesProvider = TrendingStoriesProvider._();

/// Get trending stories

final class TrendingStoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Story>>,
          List<Story>,
          FutureOr<List<Story>>
        >
    with $FutureModifier<List<Story>>, $FutureProvider<List<Story>> {
  /// Get trending stories
  const TrendingStoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trendingStoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trendingStoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<Story>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Story>> create(Ref ref) {
    return trendingStories(ref);
  }
}

String _$trendingStoriesHash() => r'd4cfb124fad9cefdd02f0135efa17320768ce5ec';

/// Get recent stories

@ProviderFor(recentStories)
const recentStoriesProvider = RecentStoriesProvider._();

/// Get recent stories

final class RecentStoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Story>>,
          List<Story>,
          FutureOr<List<Story>>
        >
    with $FutureModifier<List<Story>>, $FutureProvider<List<Story>> {
  /// Get recent stories
  const RecentStoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentStoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentStoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<Story>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Story>> create(Ref ref) {
    return recentStories(ref);
  }
}

String _$recentStoriesHash() => r'914f6cb29ffa790eee2aef4cd032e4000546373d';
