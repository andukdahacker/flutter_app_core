import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../base/presentation/extension/context_screen_size.dart';
import '../../../../../base/presentation/extension/context_theme.dart';
import '../../../../../base/presentation/theme/app_theme_src.dart';
import '../../../../../base/presentation/widget/web_app_bar.dart';
import '../../../../../base/utils/snack_bar_utils.dart';
import '../../../../../modules/di/di.dart';
import '../../../../../modules/router/router.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';
import 'widget/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        appBar: AppBarWebWidget(
          height: context.screenHeight,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign in to your account',
              style: context.textTheme.titleMedium?.copyWith(
                  color: AppColor.primary, fontWeight: FontWeight.w700),
            ),
            InkWell(
              onTap: () {
                context.go(Routes.signUp.path);
              },
              child: RichText(
                text: TextSpan(
                  text: 'Or ',
                  style: context.textTheme.labelLarge,
                  children: [
                    TextSpan(
                      text: 'Create a new account',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: AppColor.primary,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Center(child: LoginFormWidget()),
          ],
        ),
      ),
    );
  }
}
