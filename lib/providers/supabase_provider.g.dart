// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Supabase client provider - Global access to Supabase client

@ProviderFor(supabaseClient)
const supabaseClientProvider = SupabaseClientProvider._();

/// Supabase client provider - Global access to Supabase client

final class SupabaseClientProvider
    extends
        $FunctionalProvider<
          supabase.SupabaseClient,
          supabase.SupabaseClient,
          supabase.SupabaseClient
        >
    with $Provider<supabase.SupabaseClient> {
  /// Supabase client provider - Global access to Supabase client
  const SupabaseClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseClientHash();

  @$internal
  @override
  $ProviderElement<supabase.SupabaseClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  supabase.SupabaseClient create(Ref ref) {
    return supabaseClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(supabase.SupabaseClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<supabase.SupabaseClient>(value),
    );
  }
}

String _$supabaseClientHash() => r'916f8f3f95de3da91c10f0ffe5307c91dddae4ec';
