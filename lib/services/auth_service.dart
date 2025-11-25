import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../models/user.dart';

/// Authentication service - Handles all Supabase auth operations
class AuthService {
  final supabase.SupabaseClient _client;

  AuthService(this._client);

  /// Stream of auth state changes with full user profile
  /// Filters out token refresh events to avoid unnecessary profile fetches
  Stream<User?> get authStateChanges {
    return _client.auth.onAuthStateChange
        .where(
          (event) => event.event != supabase.AuthChangeEvent.tokenRefreshed,
        )
        .asyncMap((event) async {
          final user = event.session?.user;
          if (user == null) return null;

          // Fetch full profile from database
          return await getCurrentUser();
        });
  }

  /// Get current authenticated user with full profile data
  Future<User?> getCurrentUser() async {
    final supabaseUser = _client.auth.currentUser;
    if (supabaseUser == null) return null;

    try {
      // Fetch full profile from profiles table
      final profileData = await _client
          .from('profiles')
          .select()
          .eq('id', supabaseUser.id)
          .single();

      return User.fromJson(profileData);
    } catch (e) {
      // If profile doesn't exist yet, return null
      return null;
    }
  }

  /// Check if user is authenticated
  bool get isAuthenticated => _client.auth.currentUser != null;

  /// Sign up with email and password
  Future<User> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      // 1. Create auth user
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw supabase.AuthException('Inscription échouée');
      }

      // 2. Create profile in profiles table
      final profileData = {
        'id': response.user!.id,
        'email': email,
        'username': username,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      };

      await _client.from('profiles').insert(profileData);

      // 3. Return user with profile data
      return User.fromJson(profileData);
    } on supabase.AuthException catch (e) {
      throw supabase.AuthException(_getReadableErrorMessage(e.message));
    } catch (e) {
      throw supabase.AuthException('Erreur lors de l\'inscription: $e');
    }
  }

  /// Sign in with email and password
  Future<User> signIn({required String email, required String password}) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw supabase.AuthException('Connexion échouée');
      }

      // Fetch full profile from database
      final profileData = await _client
          .from('profiles')
          .select()
          .eq('id', response.user!.id)
          .single();

      return User.fromJson(profileData);
    } on supabase.AuthException catch (e) {
      throw supabase.AuthException(_getReadableErrorMessage(e.message));
    } catch (e) {
      throw supabase.AuthException('Erreur lors de la connexion: $e');
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      throw supabase.AuthException('Erreur lors de la déconnexion: $e');
    }
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _client.auth.resetPasswordForEmail(email);
    } on supabase.AuthException catch (e) {
      throw supabase.AuthException(_getReadableErrorMessage(e.message));
    } catch (e) {
      throw supabase.AuthException('Erreur lors de la réinitialisation: $e');
    }
  }

  /// Convert Supabase error messages to user-friendly French messages
  String _getReadableErrorMessage(String message) {
    if (message.contains('Invalid login credentials')) {
      return 'Email ou mot de passe incorrect';
    }
    if (message.contains('User already registered')) {
      return 'Cet email est déjà utilisé';
    }
    if (message.contains('Email not confirmed')) {
      return 'Veuillez confirmer votre email';
    }
    if (message.contains('Password should be at least')) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    }
    if (message.contains('Unable to validate email address')) {
      return 'Adresse email invalide';
    }
    if (message.contains('Email rate limit exceeded')) {
      return 'Trop de tentatives. Veuillez réessayer plus tard';
    }

    return message;
  }
}
