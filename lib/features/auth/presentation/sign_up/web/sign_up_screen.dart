import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../base/presentation/extension/context_theme.dart';
import '../../../../../base/presentation/extension/extension.dart';
import '../../../../../base/presentation/theme/app_color.dart';
import '../../../../../base/presentation/widget/spacing_widgets.dart';
import '../../../../../base/presentation/widget/web_app_bar.dart';
import '../../../../../modules/router/router.dart';
import 'widget/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WebAppBar(height: context.screenHeight),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Create a new account',
            style: context.textTheme.titleMedium?.copyWith(
                color: AppColor.primary, fontWeight: FontWeight.w700),
          ),
          InkWell(
            onTap: () {
              context.go(Routes.login.path);
            },
            child: RichText(
              text: TextSpan(
                text: 'Or ',
                style: context.textTheme.labelLarge,
                children: [
                  TextSpan(
                    text: 'Sign in to an existing account',
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
          height16,
          const SignUpFormWidget(),
        ],
      ),
    );
  }
}
