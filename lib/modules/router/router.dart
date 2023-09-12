import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/auth/presentation/login/web/login_screen.dart';
import '../../features/auth/presentation/sign_up/web/sign_up_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/profile/presentation/view/profile_screen.dart';
import '../di/di.dart';

class AppRouter {
  static final rootNavKey = GlobalKey<NavigatorState>();

  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static GoRouter get router => _router;

  static final _router = GoRouter(
      navigatorKey: rootNavKey,
      initialLocation: Routes.home.path,
      routes: [
        GoRoute(
          path: Routes.login.path,
          name: Routes.login.name,
          pageBuilder: (context, state) =>
              MaterialPage(key: state.pageKey, child: const LoginScreen()),
        ),
        GoRoute(
          path: Routes.signUp.path,
          name: Routes.signUp.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const SignUpScreen(),
          ),
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
              pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey, child: const ProfileScreen()),
            )
          ],
        ),
      ],
      redirect: (context, state) {
        final authenticated = getIt<AuthCubit>().state.authenticated;
        if (!authenticated) {
          if (state.uri.path == Routes.signUp.path) {
            return null;
          }
          return Routes.login.path;
        }
        return null;
      });
}

enum Routes {
  login(name: 'login', path: '/login'),
  signUp(name: 'sign_up', path: '/sign_up'),
  home(name: 'home', path: '/'),
  profile(name: 'profile', path: 'profile');

  const Routes({required this.name, required this.path});

  final String name;
  final String path;
}
