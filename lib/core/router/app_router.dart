import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/story/story_details.dart';
import '../../screens/authentication/auth_screen.dart';
import '../../screens/search/search_screen.dart';
import '../../screens/discover/discover_screen.dart';
import '../../screens/library/library_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/story_detail/story_detail_screen.dart';
import '../widgets/navigation/navigation_shell.dart';

/// App routes
class AppRoutes {
  static const String auth = '/auth';
  static const String search = '/search';
  static const String discover = '/discover';
  static const String library = '/library';
  static const String profile = '/profile';
  static const String storyDetail = '/story';
}

/// GoRouter configuration
final router = GoRouter(
  initialLocation: AppRoutes.discover,
  routes: [
    // Auth route (no bottom navigation)
    GoRoute(
      path: AppRoutes.auth,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AuthScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),

    // Story detail route (no bottom navigation)
    GoRoute(
      path: AppRoutes.storyDetail,
      pageBuilder: (context, state) {
        final storyDetails = state.extra as StoryDetails;
        return CustomTransitionPage(
          key: state.pageKey,
          child: StoryDetailScreen(storyDetails: storyDetails),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        );
      },
    ),

    // Shell route with persistent bottom navigation
    ShellRoute(
      builder: (context, state, child) => NavigationShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.search,
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: AppRoutes.discover,
          builder: (context, state) => const DiscoverScreen(),
        ),
        GoRoute(
          path: AppRoutes.library,
          builder: (context, state) => const LibraryScreen(),
        ),
        GoRoute(
          path: AppRoutes.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
