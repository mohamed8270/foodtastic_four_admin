import 'package:foodtastic_four_admin/features/authentication/screens/auth/pages.dart';
import 'package:foodtastic_four_admin/features/authentication/screens/intro/pages.dart';
import 'package:foodtastic_four_admin/features/navigation/widgets/bottom_navigation_widget.dart';
import 'package:foodtastic_four_admin/features/products/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final AppRouter instance = AppRouter._();

  final GoRouter _router = GoRouter(
      initialLocation: '/',
      routerNeglect: false,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
        GoRoute(path: '/onboard', builder: (context, state) => const OnboardingScreen()),
        GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
        GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
        GoRoute(path: '/bottomNavbar', builder: (context, state) => const BottomNavigationWidget()),
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      ]
  );

  GoRouter get router => _router;
}