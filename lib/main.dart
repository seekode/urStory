import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/navigation/main_navigation.dart';

void main() {
  runApp(const UrStoryApp());
}

class UrStoryApp extends StatelessWidget {
  const UrStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UrStory',
      debugShowCheckedModeBanner: false,

      // Theme configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Home screen with navigation
      home: const MainNavigation(),
    );
  }
}
