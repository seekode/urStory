import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../screens/authentication/auth_screen.dart';
import '../widgets/navigation/main_navigation.dart';

/// App routes
class AppRoutes {
  static const String home = '/';
  static const String auth = '/auth';
  static const String search = '/search';
  static const String discover = '/discover';
  static const String create = '/create';
  static const String library = '/library';
}

/// GoRouter configuration provider
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const MainNavigation(),
      ),
      GoRoute(
        path: AppRoutes.auth,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AuthScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
    ],
  );
});
