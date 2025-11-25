import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

part 'supabase_provider.g.dart';

/// Supabase client provider - Global access to Supabase client
@riverpod
supabase.SupabaseClient supabaseClient(Ref ref) {
  return supabase.Supabase.instance.client;
}
