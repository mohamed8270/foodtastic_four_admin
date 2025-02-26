import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/features/authentication/screens/auth/pages.dart';
import 'package:foodtastic_four_admin/features/authentication/screens/intro/pages.dart';
import 'package:foodtastic_four_admin/features/navigation/bottom_navigation_widget.dart';
import 'package:foodtastic_four_admin/features/products/screens/home_screen.dart';
import 'package:foodtastic_four_admin/features/products/screens/products_screen.dart';
import 'package:foodtastic_four_admin/features/products/screens/profile_screen.dart';
import 'package:foodtastic_four_admin/routes/middleware.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final AppRouter instance = AppRouter._();

  final GoRouter _router = GoRouter(
      initialLocation: '/',
      routerNeglect: false,
      debugLogDiagnostics: true,
      redirect: (context, state) async {
        String? redirectPath = await Middleware().routeMiddleware(state);
        return redirectPath;
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
        GoRoute(path: '/onboard', builder: (context, state) => const OnboardingScreen()),
        GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
        GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
        ShellRoute(
          navigatorKey: GlobalKey<NavigatorState>(),
          builder: (context, state, child) => BottomNavigationWidget(child: child),
          routes: [
            GoRoute(path: '/bottomNavbar/home', builder: (context, state) => const HomeScreen()),
            GoRoute(path: '/bottomNavbar/orders', builder: (context, state) => const ProductsScreen()),
            GoRoute(path: '/bottomNavbar/profile', builder: (context, state) => const ProfileScreen()),
        ],),
      ]
  );

  GoRouter get router => _router;
}