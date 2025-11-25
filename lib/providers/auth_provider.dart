import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import 'supabase_provider.dart';

part 'auth_provider.g.dart';

/// Auth service provider
@riverpod
AuthService authService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthService(client);
}

/// Auth state provider - SINGLE SOURCE OF TRUTH
/// Exposes auth state changes stream from AuthService
@riverpod
Stream<User?> auth(Ref ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
}
