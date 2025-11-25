import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../providers/auth_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_constants.dart';
import '../../router/app_router.dart';

/// Navigation shell with custom floating bottom navigation bar
/// Wraps the content from ShellRoute and provides persistent bottom navigation
class NavigationShell extends ConsumerWidget {
  final Widget child;

  const NavigationShell({super.key, required this.child});

  // Navigation items configuration
  static const List<_NavItem> _navItems = [
    _NavItem(
      route: AppRoutes.search,
      icon: Icons.search_outlined,
      selectedIcon: Icons.search,
      label: 'Recherche',
    ),
    _NavItem(
      route: AppRoutes.discover,
      icon: Icons.explore_outlined,
      selectedIcon: Icons.explore,
      label: 'Découvrir',
    ),
    _NavItem(
      route: AppRoutes.library,
      icon: Icons.library_books_outlined,
      selectedIcon: Icons.library_books,
      label: 'Bibliothèque',
      requiresAuth: true,
    ),
    _NavItem(
      route: AppRoutes.profile,
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      label: 'Profil',
      requiresAuth: true,
    ),
  ];

  void _handleNavigation(BuildContext context, WidgetRef ref, int index) {
    final navItem = _navItems[index];

    // Check if tab requires authentication
    if (navItem.requiresAuth) {
      final authService = ref.read(authServiceProvider);
      final isAuthenticated = authService.isAuthenticated;

      if (!isAuthenticated) {
        // Redirect to auth screen
        context.push(AppRoutes.auth);
        return;
      }
    }

    // Navigate to the selected route
    context.go(navItem.route);
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final index = _navItems.indexWhere((item) => item.route == location);
    return index >= 0 ? index : 1; // Default to Discover if not found
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentIndex = _getCurrentIndex(context);

    // Listen to auth state changes and redirect to Discover on logout
    ref.listen(authProvider, (previous, next) {
      final wasAuthenticated = previous?.value != null;
      final isAuthenticated = next.value != null;

      // If user logged out and current page requires auth
      if (wasAuthenticated &&
          !isAuthenticated &&
          _navItems[currentIndex].requiresAuth) {
        context.go(AppRoutes.discover);
      }
    });

    return Scaffold(
      body: child,
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(
          AppConstants.navbarMarginHorizontal,
          0,
          AppConstants.navbarMarginHorizontal,
          AppConstants.navbarMarginBottom,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.navbarPaddingHorizontal,
          vertical: AppConstants.navbarPaddingVertical,
        ),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkSurfaceElevated
              : AppColors.lightSurfaceElevated,
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadiusFloating,
          ),
          boxShadow: isDark
              ? AppConstants.shadowDarkMedium
              : AppConstants.shadowMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navItems.length, (index) {
            return _NavButton(
              item: _navItems[index],
              isSelected: currentIndex == index,
              isDark: isDark,
              onTap: () => _handleNavigation(context, ref, index),
            );
          }),
        ),
      ),
    );
  }
}

/// Navigation item data
class _NavItem {
  final String route;
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool requiresAuth;

  const _NavItem({
    required this.route,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.requiresAuth = false,
  });
}

/// Custom navigation button
class _NavButton extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = isDark
        ? AppColors.darkAccentPrimary
        : AppColors.lightAccentPrimary;
    final inactiveColor = isDark
        ? AppColors.darkTextTertiary
        : AppColors.lightTextTertiary;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusCard),
        splashColor: activeColor.withValues(alpha: 0.1),
        highlightColor: activeColor.withValues(alpha: 0.05),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppConstants.spacingSm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? item.selectedIcon : item.icon,
                color: isSelected ? activeColor : inactiveColor,
                size: 22,
              ),
              const SizedBox(height: 2),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? activeColor : inactiveColor,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
