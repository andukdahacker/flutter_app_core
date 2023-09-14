import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../modules/router/router.dart';
import '../../auth/presentation/bloc/auth_cubit.dart';
import '../../auth/presentation/login/bloc/login_cubit.dart';
import '../../auth/presentation/login/bloc/login_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Home page'),
            BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) => previous.user != current.user,
              builder: (context, state) {
                return Text('${state.user?.email}');
              },
            ),
            TextButton(
              onPressed: () {
                context.push('/profile');
              },
              child: const Text('To profile screen'),
            ),
          ],
        ),
      ),
    );
  }
}
