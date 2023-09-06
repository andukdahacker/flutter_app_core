import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../router/router.dart';
import '../auth/presentation/bloc/auth_cubit.dart';
import '../auth/presentation/bloc/auth_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        switch (state) {
          case Authenticated():
            context.go(Routes.home);
          case Unauthenticated():
            context.go(Routes.login);
          default:
            return;
        }
      },
      child: const Center(
        child: Text('SPLASH'),
      ),
    );
  }
}
