import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/login/login_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/splash/splash_screen.dart';

class AppRouter {
  static final rootNavKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final _router = GoRouter(
    navigatorKey: rootNavKey,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      )
    ],
  );
}

class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String splash = '/';
}
