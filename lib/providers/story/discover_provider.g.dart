// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// State for trending stories
/// Keeps data in memory to avoid reloading on each visit to Discover

@ProviderFor(TrendingStories)
const trendingStoriesProvider = TrendingStoriesProvider._();

/// State for trending stories
/// Keeps data in memory to avoid reloading on each visit to Discover
final class TrendingStoriesProvider
    extends $NotifierProvider<TrendingStories, List<StoryDetails>> {
  /// State for trending stories
  /// Keeps data in memory to avoid reloading on each visit to Discover
  const TrendingStoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trendingStoriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trendingStoriesHash();

  @$internal
  @override
  TrendingStories create() => TrendingStories();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<StoryDetails> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<StoryDetails>>(value),
    );
  }
}

String _$trendingStoriesHash() => r'fc4d4b76fd7b20b202b13391ef6fa28628c3a759';

/// State for trending stories
/// Keeps data in memory to avoid reloading on each visit to Discover

abstract class _$TrendingStories extends $Notifier<List<StoryDetails>> {
  List<StoryDetails> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<StoryDetails>, List<StoryDetails>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<StoryDetails>, List<StoryDetails>>,
              List<StoryDetails>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// State for recent stories
/// Keeps data in memory to avoid reloading on each visit to Discover

@ProviderFor(RecentStories)
const recentStoriesProvider = RecentStoriesProvider._();

/// State for recent stories
/// Keeps data in memory to avoid reloading on each visit to Discover
final class RecentStoriesProvider
    extends $NotifierProvider<RecentStories, List<StoryDetails>> {
  /// State for recent stories
  /// Keeps data in memory to avoid reloading on each visit to Discover
  const RecentStoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentStoriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentStoriesHash();

  @$internal
  @override
  RecentStories create() => RecentStories();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<StoryDetails> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<StoryDetails>>(value),
    );
  }
}

String _$recentStoriesHash() => r'2f12f3789811242b8b2780f2ab9690ef4ce56b79';

/// State for recent stories
/// Keeps data in memory to avoid reloading on each visit to Discover

abstract class _$RecentStories extends $Notifier<List<StoryDetails>> {
  List<StoryDetails> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<StoryDetails>, List<StoryDetails>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<StoryDetails>, List<StoryDetails>>,
              List<StoryDetails>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
