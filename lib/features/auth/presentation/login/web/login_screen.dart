import 'package:flutter/material.dart';
import 'package:flutter_app_core/modules/router/router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../base/presentation/extension/context_screen_size.dart';
import '../../../../../base/presentation/extension/context_theme.dart';
import '../../../../../base/presentation/theme/app_theme_src.dart';
import '../../../../../base/presentation/widget/adaptive_scaffold_widget.dart';
import '../../../../../base/presentation/widget/web_app_bar.dart';
import 'widget/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WebAppBar(
        height: context.screenHeight,
      ),
      body: AdaptiveWidgetBuilder(
        extraSmallScreenWidget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in to your account',
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColor.primary, fontWeight: FontWeight.w700),
              ),
              InkWell(
                onTap: () {
                  print('LoginScreen.build');
                  context.push(Routes.signUp.path);
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
                            decorationThickness: 2),
                      ),
                    ],
                  ),
                ),
              ),
              const LoginFormWidget(),
            ],
          ),
        ),
        smallScreenWidget: Center(
          child: Text('small'),
        ),
        mediumScreenWidget: Center(
          child: Text('Medium'),
        ),
        largeScreenWidget: Center(
          child: Text('Large'),
        ),
      ),
    );
  }
}
