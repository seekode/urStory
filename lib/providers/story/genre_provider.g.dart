// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// State for genres/categories
/// Keeps data in memory to avoid reloading on each visit to Discover

@ProviderFor(GenresNotifier)
const genresProvider = GenresNotifierProvider._();

/// State for genres/categories
/// Keeps data in memory to avoid reloading on each visit to Discover
final class GenresNotifierProvider
    extends $NotifierProvider<GenresNotifier, List<Genre>> {
  /// State for genres/categories
  /// Keeps data in memory to avoid reloading on each visit to Discover
  const GenresNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'genresProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$genresNotifierHash();

  @$internal
  @override
  GenresNotifier create() => GenresNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Genre> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Genre>>(value),
    );
  }
}

String _$genresNotifierHash() => r'2c2c19258d65c40c272f9123765870ccc4a930a0';

/// State for genres/categories
/// Keeps data in memory to avoid reloading on each visit to Discover

abstract class _$GenresNotifier extends $Notifier<List<Genre>> {
  List<Genre> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Genre>, List<Genre>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Genre>, List<Genre>>,
              List<Genre>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
