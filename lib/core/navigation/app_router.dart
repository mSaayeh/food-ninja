import 'package:flutter/material.dart';
import 'package:food_ninja/core/navigation/main_navigation_screen.dart';
import 'package:food_ninja/features/home/presentation/home_screen.dart';
import 'package:food_ninja/features/onboarding/presentation/onboarding_screen.dart';
import 'package:food_ninja/features/popular_restaurants/presentation/popular_restaurants_screen.dart';
import 'package:food_ninja/features/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

const splash = "/";
const home = "/home";
const onboarding = "/onboarding";
const login = "login";
const signup = "signup";
const auth = "/auth";
const popularRestaurats = 'popular_restaurants';
const popularMeals = 'popular_meals';
const mainNavigationScreen = '/main_nav';

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
        path: mainNavigationScreen,
        builder: (context, state) => const MainNavigationScreen(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: popularRestaurats,
            builder: (context, state) => const PopularRestaurantsScreen(),
          ),
          GoRoute(
            path: popularMeals,
            builder: (context, state) => const Placeholder(),
          ),
        ],
      ),
      GoRoute(
        path: auth,
        redirect: (context, state) => "$auth/$login",
        routes: [
          GoRoute(
            path: login,
            builder: (context, state) => const Placeholder(),
          ),
          GoRoute(
            path: signup,
            builder: (context, state) => const Placeholder(),
          ),
        ],
      ),
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
