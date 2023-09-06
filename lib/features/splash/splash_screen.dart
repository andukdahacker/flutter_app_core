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
  void didChangeDependencies() {
    final authenticated = getIt<AuthCubit>().state.authenticated;

    if(authenticated) {
      context.go('/home');
    } else {
      context.go('/login');
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.authenticated != current.authenticated,
      listener: (context, state) {
        if(state.authenticated) {
          context.go('/home');
        } else {
          context.go('/login');
        }
      },
      buildWhen: (previous, current) {
        print('SplashScreen.build ${previous}');
        print('SplashScreen.build ${current}');
        return true;
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                const Text('SPLASH'),
                TextButton(onPressed: () {
                  getIt<AuthCubit>().checkAuth();
                }, child: const Text('Login')),
                TextButton(onPressed: () {
                  getIt<AuthCubit>().toggleLoading();
                }, child: Text('Toggle loading')),
                TextButton(onPressed: () {
                  final theme = getIt<AppCubit>().state.themeMode;
                  if(theme == ThemeMode.light) {
                    getIt<AppCubit>().changeTheme(ThemeMode.dark);
                  } else {
                    getIt<AppCubit>().changeTheme(ThemeMode.light);
                  }

                }, child: Text('Change theme'))
              ],
            ),
          ),
        );
      },
    );
  }
}
