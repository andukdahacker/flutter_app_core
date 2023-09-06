import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/login/login_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/profile/presentation/view/profile_screen.dart';
import '../features/splash/splash_screen.dart';

class AppRouter {
  static final rootNavKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final _router = GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen(),
          routes: [
            GoRoute(
              path: 'login',
              builder: (context, state) => const LoginScreen(),
            ),
            GoRoute(
              path: 'home',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'profile',
                  builder: (context, state) => const ProfileScreen(),
                )
              ],
            )
          ]),
    ],
  );
}

class Routes {
  static const String login = '/login';
  static const String home = ' /home';
  static const String splash = '/';
}
