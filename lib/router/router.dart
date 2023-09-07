import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omt_base_project/features/auth/presentation/login/web/login_screen.dart';

import '../features/home/presentation/home_screen.dart';
import '../features/profile/presentation/view/profile_screen.dart';
import '../features/splash/splash_screen.dart';

class AppRouter {
  static final rootNavKey = GlobalKey<NavigatorState>();

  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static GoRouter get router => _router;

  static final _router = GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const SplashScreen()),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const LoginScreen()),
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen()),
        routes: [
          GoRoute(
            path: Routes.profile.path,
            name: Routes.profile.name,
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const ProfileScreen()),
          )
        ],
      )
    ],
  );
}

enum Routes {
  splash(name: 'splash', path: '/'),
  login(name: 'login', path: '/login'),
  home(name: 'home', path: '/home'),
  profile(name: 'profile', path: 'profile');

  const Routes({required this.name, required this.path});

  final String name;
  final String path;
}
