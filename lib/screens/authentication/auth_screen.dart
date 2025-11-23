import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_constants.dart';
import 'widgets/auth_header.dart';
import 'widgets/auth_tab_selector.dart';
import 'widgets/login_form.dart';
import 'widgets/signup_form.dart';

/// Authentication screen with login and sign up - fully custom design
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _isLogin = true; // true = login, false = signup
  final _loginFormKey = GlobalKey<FormState>();
  final _signupFormKey = GlobalKey<FormState>();

  // Login controllers
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();

  // Signup controllers
  final _signupEmailController = TextEditingController();
  final _signupPasswordController = TextEditingController();
  final _signupUsernameController = TextEditingController();
  final _signupConfirmPasswordController = TextEditingController();

  bool _obscureLoginPassword = true;
  bool _obscureSignupPassword = true;
  bool _obscureSignupConfirmPassword = true;

  @override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _signupEmailController.dispose();
    _signupPasswordController.dispose();
    _signupUsernameController.dispose();
    _signupConfirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_loginFormKey.currentState!.validate()) return;

    await ref.read(authNotifierProvider.notifier).signIn(
          email: _loginEmailController.text.trim(),
          password: _loginPasswordController.text,
        );

    if (mounted) {
      final authState = ref.read(authNotifierProvider);
      authState.when(
        data: (user) {
          if (user != null) {
            context.pop();
          }
        },
        loading: () {},
        error: (error, _) {
          _showErrorSnackBar(error.toString());
        },
      );
    }
  }

  Future<void> _handleSignup() async {
    if (!_signupFormKey.currentState!.validate()) return;

    await ref.read(authNotifierProvider.notifier).signUp(
          email: _signupEmailController.text.trim(),
          password: _signupPasswordController.text,
          username: _signupUsernameController.text.trim().isEmpty
              ? null
              : _signupUsernameController.text.trim(),
        );

    if (mounted) {
      final authState = ref.read(authNotifierProvider);
      authState.when(
        data: (user) {
          if (user != null) {
            context.pop();
          }
        },
        loading: () {},
        error: (error, _) {
          _showErrorSnackBar(error.toString());
        },
      );
    }
  }

  void _showErrorSnackBar(String message) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isDark ? AppColors.darkError : AppColors.lightError,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusCard),
        ),
        margin: const EdgeInsets.all(AppConstants.marginMobile),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkBackgroundPrimary
          : AppColors.lightBackgroundPrimary,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button
            const AuthHeader(),

            // Animated form content
            Expanded(
              child: AnimatedSwitcher(
                duration: AppConstants.durationSlow,
                switchInCurve: AppConstants.curveStandard,
                switchOutCurve: AppConstants.curveStandard,
                transitionBuilder: (child, animation) {
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
                child: _isLogin
                    ? LoginForm(
                        formKey: _loginFormKey,
                        emailController: _loginEmailController,
                        passwordController: _loginPasswordController,
                        obscurePassword: _obscureLoginPassword,
                        onTogglePasswordVisibility: () {
                          setState(() => _obscureLoginPassword = !_obscureLoginPassword);
                        },
                        onSubmit: _handleLogin,
                        isLoading: isLoading,
                      )
                    : SignupForm(
                        formKey: _signupFormKey,
                        usernameController: _signupUsernameController,
                        emailController: _signupEmailController,
                        passwordController: _signupPasswordController,
                        confirmPasswordController: _signupConfirmPasswordController,
                        obscurePassword: _obscureSignupPassword,
                        obscureConfirmPassword: _obscureSignupConfirmPassword,
                        onTogglePasswordVisibility: () {
                          setState(() => _obscureSignupPassword = !_obscureSignupPassword);
                        },
                        onToggleConfirmPasswordVisibility: () {
                          setState(() => _obscureSignupConfirmPassword = !_obscureSignupConfirmPassword);
                        },
                        onSubmit: _handleSignup,
                        isLoading: isLoading,
                      ),
              ),
            ),

            // Tab selector at bottom
            AuthTabSelector(
              isLoginSelected: _isLogin,
              onLoginTap: () => setState(() => _isLogin = true),
              onSignupTap: () => setState(() => _isLogin = false),
            ),
            const SizedBox(height: AppConstants.spacingLg),
          ],
        ),
      ),
    );
  }
}
