import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../screens/search/search_screen.dart';
import '../../../screens/discover/discover_screen.dart';
import '../../../screens/create/create_screen.dart';
import '../../../screens/library/library_screen.dart';
import '../../../providers/auth_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_constants.dart';
import '../../router/app_router.dart';

/// Main navigation widget with custom floating bottom navigation bar
class MainNavigation extends ConsumerStatefulWidget {
  const MainNavigation({super.key});

  @override
  ConsumerState<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends ConsumerState<MainNavigation> {
  int _currentIndex = 1; // Start with Découvrir (index 1)

  final List<Widget> _screens = const [
    RechercheScreen(),
    DecouvrirScreen(),
    CreerScreen(),
    BibliothequeScreen(),
  ];

  final List<_NavItem> _navItems = const [
    _NavItem(
      icon: Icons.search_outlined,
      selectedIcon: Icons.search,
      label: 'Recherche',
    ),
    _NavItem(
      icon: Icons.explore_outlined,
      selectedIcon: Icons.explore,
      label: 'Découvrir',
    ),
    _NavItem(
      icon: Icons.edit_outlined,
      selectedIcon: Icons.edit,
      label: 'Créer',
      requiresAuth: true,
    ),
    _NavItem(
      icon: Icons.library_books_outlined,
      selectedIcon: Icons.library_books,
      label: 'Bibliothèque',
      requiresAuth: true,
    ),
  ];

  void _handleNavigation(int index) {
    // Check if tab requires authentication
    if (_navItems[index].requiresAuth) {
      final authService = ref.read(authServiceProvider);
      final isAuthenticated = authService.isAuthenticated;

      if (!isAuthenticated) {
        // Redirect to auth screen
        context.push(AppRoutes.auth);
        return;
      }
    }

    // Navigate to the selected tab
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Listen to auth state changes and redirect to Discover on logout
    ref.listen<bool>(isAuthenticatedProvider, (previous, next) {
      // If user logged out and current page requires auth
      if (previous == true && next == false && _navItems[_currentIndex].requiresAuth) {
        setState(() {
          _currentIndex = 1; // Redirect to Découvrir
        });
      }
    });

    return Scaffold(
      body: AnimatedSwitcher(
        duration: AppConstants.durationSlow,
        switchInCurve: AppConstants.curveStandard,
        switchOutCurve: AppConstants.curveStandard,
        transitionBuilder: (child, animation) {
          // Animation ample et fluide
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(AppConstants.pageTransitionOffset, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: AppConstants.curveStandard,
          ));

          final reverseOffsetAnimation = Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-AppConstants.pageTransitionOffset, 0),
          ).animate(CurvedAnimation(
            parent: animation,
            curve: AppConstants.curveStandard,
          ));

          return SlideTransition(
            position: animation.status == AnimationStatus.reverse
                ? reverseOffsetAnimation
                : offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: Container(
          key: ValueKey<int>(_currentIndex),
          child: _screens[_currentIndex],
        ),
      ),
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
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusFloating),
          boxShadow: isDark
              ? AppConstants.shadowDarkMedium
              : AppConstants.shadowMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navItems.length, (index) {
            return _NavButton(
              item: _navItems[index],
              isSelected: _currentIndex == index,
              isDark: isDark,
              onTap: () => _handleNavigation(index),
            );
          }),
        ),
      ),
    );
  }
}

/// Navigation item data
class _NavItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool requiresAuth;

  const _NavItem({
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
