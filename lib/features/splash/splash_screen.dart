import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_cubit.dart';
import '../../di/di.dart';
import '../../router/router.dart';
import '../auth/presentation/bloc/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getIt<AuthCubit>().checkAuth();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
      previous.authenticated != current.authenticated ||
          previous.loading != current.loading,
      listener: (context, state) {
        if (state.authenticated) {
          context.go(Routes.home.path);
        } else {
          context.go(Routes.login.path);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text('SPLASH'),
              TextButton(
                  onPressed: () {
                    context.go(Routes.login.path);
                  },
                  child: const Text('Login screen')),
              TextButton(
                  onPressed: () {
                    context.go(Routes.home.path);
                  },
                  child: const Text('To home screen')),

              TextButton(
                  onPressed: () {
                    getIt<AuthCubit>().checkAuth();
                  },
                  child: const Text('Check auth')),
              TextButton(
                  onPressed: () {
                    final theme = getIt<AppCubit>().state.themeMode;
                    if (theme == ThemeMode.light) {
                      getIt<AppCubit>().changeTheme(ThemeMode.dark);
                    } else {
                      getIt<AppCubit>().changeTheme(ThemeMode.light);
                    }
                  },
                  child: const Text('Change theme'))
            ],
          ),
        ),
      ),
    );
  }
}
