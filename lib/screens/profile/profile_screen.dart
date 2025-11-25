import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/ui/feedback/custom_notification.dart';

/// Profile screen - User profile and settings
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark
          ? AppColors.darkBackgroundPrimary
          : AppColors.lightBackgroundPrimary,
      child: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Profil Screen'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await ref.read(authServiceProvider).signOut();
                    if (context.mounted) {
                      CustomNotification.show(
                        context,
                        message: 'Déconnecté avec succès',
                        type: NotificationType.success,
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      CustomNotification.show(
                        context,
                        message: 'Erreur lors de la déconnexion',
                        type: NotificationType.error,
                      );
                    }
                  }
                },
                child: const Text('Se déconnecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
