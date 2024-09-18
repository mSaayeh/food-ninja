import 'package:flutter/material.dart';
import 'package:food_ninja/features/auth/presentation/login/login_screen.dart';
import 'package:food_ninja/features/auth/presentation/signup/sign_up_screen.dart';
import 'package:food_ninja/features/auth/presentation/signup/sign_up_success_screen.dart';
import 'package:food_ninja/features/onboarding/presentation/onboarding_screen.dart';
import 'package:food_ninja/features/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

const splash = "/";
const home = "/home";
const onboarding = "/onboarding";
const auth = "/auth";
const login = "/login";
const signup = "/signup";
const signupSuccess = "/signupSuccess";

class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: signupSuccess,
        builder: (context, state) => const SignUpSuccessScreen(),
      )
    ],
    errorBuilder: (context, state) {
      return _errorRoute();
    },
  );

  static Widget _errorRoute() {
    return const Scaffold(
      body: Center(
        child: Text('Page not found.'),
      ),
    );
  }
}
