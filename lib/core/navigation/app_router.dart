import 'package:flutter/material.dart';
import 'package:food_ninja/core/navigation/main_navigation_screen.dart';
import 'package:food_ninja/features/checkout/presentation/address_details_screen.dart';
import 'package:food_ninja/features/auth/presentation/login/login_screen.dart';
import 'package:food_ninja/features/auth/presentation/signup/sign_up_screen.dart';
import 'package:food_ninja/features/auth/presentation/signup/sign_up_success_screen.dart';
import 'package:food_ninja/features/checkout/presentation/checkout_screen.dart';
import 'package:food_ninja/features/home/data/models/restaurant.dart';
import 'package:food_ninja/features/home/presentation/home_screen.dart';
import 'package:food_ninja/features/onboarding/presentation/onboarding_screen.dart';
import 'package:food_ninja/features/popular_restaurants/presentation/popular_restaurants_screen.dart';
import 'package:food_ninja/features/restaurant/presentation/restaurant_view.dart';
import 'package:food_ninja/features/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

const splash = "/";
const home = "/home";
const onboarding = "/onboarding";
const auth = "/auth";
const login = "/login";
const signup = "/signup";
const signupSuccess = "/signupSuccess";
const popularRestaurats = 'popular_restaurants';
const popularMeals = 'popular_meals';
const mainNavigationScreen = '/main_nav';
const restaurant = '/restaurant';
const checkout = '/checkout';
const addressDetails = '/address_details';

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
        path: checkout,
        builder: (context, state) => const CheckoutScreen(),
      ),
      GoRoute(
        path: restaurant,
        builder: (context, state) {
          final restaurant = state.extra as Restaurant;
          return RestaurantView(restaurant: restaurant);
        },
      ),
      GoRoute(path: addressDetails, builder: (context, state) {
        return const AddressDetailsScreen();
      }),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: popularRestaurats,
            builder: (context, state) => const PopularRestaurantsScreen(),
          ),
        ],
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
