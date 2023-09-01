import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../base/presentation/base_page_state.dart';
import 'bloc/login_cubit.dart';
import 'bloc/login_state.dart';

@RoutePage()
class LoginScreen extends BasePageState<LoginCubit> {
  LoginScreen({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: myBloc.login,
              child: const Text('To home page'),
            ),
          ),
        );
      },
    );
  }
}
