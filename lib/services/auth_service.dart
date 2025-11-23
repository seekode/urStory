import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user.dart';

/// Authentication service
class AuthService {
  final SupabaseClient _client;

  AuthService(this._client);

  /// Get current authenticated user
  AppUser? get currentUser {
    final authUser = _client.auth.currentUser;
    if (authUser == null) return null;

    return AppUser(
      id: authUser.id,
      email: authUser.email!,
      username: authUser.userMetadata?['username'] as String?,
      isAdmin: false,
      createdAt: DateTime.parse(authUser.createdAt),
      updatedAt: DateTime.now(),
    );
  }

  /// Check if user is authenticated
  bool get isAuthenticated => _client.auth.currentUser != null;

  /// Auth state stream
  Stream<bool> get authStateChanges {
    return _client.auth.onAuthStateChange.map((event) {
      return event.session != null;
    });
  }

  /// Sign up with email and password
  Future<AppUser> signUp({
    required String email,
    required String password,
    String? username,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: username != null ? {'username': username} : null,
      );

      if (response.user == null) {
        throw Exception('Inscription échouée');
      }

      return AppUser(
        id: response.user!.id,
        email: response.user!.email!,
        username: username,
        isAdmin: false,
        createdAt: DateTime.parse(response.user!.createdAt),
        updatedAt: DateTime.now(),
      );
    } on AuthException catch (e) {
      throw Exception(_getAuthErrorMessage(e.message));
    } catch (e) {
      throw Exception('Erreur lors de l\'inscription: $e');
    }
  }

  /// Sign in with email and password
  Future<AppUser> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('Connexion échouée');
      }

      return AppUser(
        id: response.user!.id,
        email: response.user!.email!,
        username: response.user!.userMetadata?['username'] as String?,
        isAdmin: false,
        createdAt: DateTime.parse(response.user!.createdAt),
        updatedAt: DateTime.now(),
      );
    } on AuthException catch (e) {
      throw Exception(_getAuthErrorMessage(e.message));
    } catch (e) {
      throw Exception('Erreur lors de la connexion: $e');
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      throw Exception('Erreur lors de la déconnexion: $e');
    }
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _client.auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      throw Exception(_getAuthErrorMessage(e.message));
    } catch (e) {
      throw Exception('Erreur lors de la réinitialisation: $e');
    }
  }

  /// Get user-friendly error messages
  String _getAuthErrorMessage(String message) {
    if (message.contains('Invalid login credentials')) {
      return 'Email ou mot de passe incorrect';
    } else if (message.contains('User already registered')) {
      return 'Cet email est déjà utilisé';
    } else if (message.contains('Email not confirmed')) {
      return 'Veuillez confirmer votre email';
    } else if (message.contains('Password should be at least')) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    }
    return message;
  }
}
