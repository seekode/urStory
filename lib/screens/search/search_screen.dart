import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Search screen - Search stories by name
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark
          ? AppColors.darkBackgroundPrimary
          : AppColors.lightBackgroundPrimary,
      child: const SafeArea(
        bottom: false,
        child: Center(child: Text('Recherche')),
      ),
    );
  }
}
