import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  try {
    await Supabase.initialize(
      url: 'https://glhllddtgvhsttqgicez.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdsaGxsZGR0Z3Zoc3R0cWdpY2V6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM3OTQ1NTgsImV4cCI6MjA3OTM3MDU1OH0.UHw5xzeMTsoAfosCIzm8vOLdXXI3bJ6g77nmL6pgAzI',
    );
  } catch (e) {
    debugPrint('Erreur initialisation Supabase: $e');
  }

  runApp(const ProviderScope(child: UrStoryApp()));
}

class UrStoryApp extends StatelessWidget {
  const UrStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'UrStory',
      debugShowCheckedModeBanner: false,

      // Theme configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Router configuration
      routerConfig: router,
    );
  }
}
