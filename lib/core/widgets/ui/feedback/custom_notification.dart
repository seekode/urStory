import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_constants.dart';

/// Notification type
enum NotificationType { success, error, warning, info }

/// Custom notification overlay
class CustomNotification {
  static OverlayEntry? _currentOverlay;

  /// Show a notification at the top of the screen
  static void show(
    BuildContext context, {
    required String message,
    NotificationType type = NotificationType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    // Remove previous notification if exists
    _currentOverlay?.remove();
    _currentOverlay = null;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final overlay = Overlay.of(context);

    _currentOverlay = OverlayEntry(
      builder: (context) => _NotificationWidget(
        message: message,
        type: type,
        isDark: isDark,
        onDismiss: () {
          _currentOverlay?.remove();
          _currentOverlay = null;
        },
      ),
    );

    overlay.insert(_currentOverlay!);

    // Auto dismiss after duration
    Future.delayed(duration, () {
      _currentOverlay?.remove();
      _currentOverlay = null;
    });
  }

  /// Dismiss current notification
  static void dismiss() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}

/// Notification widget
class _NotificationWidget extends StatefulWidget {
  final String message;
  final NotificationType type;
  final bool isDark;
  final VoidCallback onDismiss;

  const _NotificationWidget({
    required this.message,
    required this.type,
    required this.isDark,
    required this.onDismiss,
  });

  @override
  State<_NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<_NotificationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppConstants.durationMedium,
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: AppConstants.curveEaseOut,
          ),
        );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: AppConstants.curveEaseOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getBackgroundColor() {
    switch (widget.type) {
      case NotificationType.success:
        return widget.isDark ? AppColors.darkSuccess : AppColors.lightSuccess;
      case NotificationType.error:
        return widget.isDark ? AppColors.darkError : AppColors.lightError;
      case NotificationType.warning:
        return widget.isDark ? AppColors.darkWarning : AppColors.lightWarning;
      case NotificationType.info:
        return widget.isDark ? AppColors.darkInfo : AppColors.lightInfo;
    }
  }

  Color _getTextColor() {
    // All notification types use white text for better contrast on colored backgrounds
    return Colors.white;
  }

  IconData _getIcon() {
    switch (widget.type) {
      case NotificationType.success:
        return Icons.check_circle_outline;
      case NotificationType.error:
        return Icons.error_outline;
      case NotificationType.warning:
        return Icons.warning_amber_outlined;
      case NotificationType.info:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.marginMobile,
                vertical: AppConstants.spacing,
              ),
              child: GestureDetector(
                onTap: () async {
                  await _controller.reverse();
                  widget.onDismiss();
                },
                child: Container(
                  padding: const EdgeInsets.all(AppConstants.spacing),
                  decoration: BoxDecoration(
                    color: _getBackgroundColor(),
                    borderRadius: BorderRadius.circular(
                      AppConstants.borderRadiusCard,
                    ),
                    boxShadow: widget.isDark
                        ? AppConstants.shadowDarkMedium
                        : AppConstants.shadowMedium,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _getIcon(),
                        color: _getTextColor(),
                        size: AppConstants.iconSize,
                      ),
                      const SizedBox(width: AppConstants.spacingMd),
                      Expanded(
                        child: Text(
                          widget.message,
                          style: TextStyle(
                            color: _getTextColor(),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppConstants.spacingSm),
                      Icon(
                        Icons.close,
                        color: _getTextColor().withValues(alpha: 0.7),
                        size: AppConstants.iconSizeSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
