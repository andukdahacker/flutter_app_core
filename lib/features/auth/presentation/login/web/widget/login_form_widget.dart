import 'package:flutter/material.dart';

import '../../../../../../base/presentation/extension/extension.dart';
import '../../../../../../base/presentation/widget/spacing_widgets.dart';
import '../../../../../../modules/di/di.dart';
import '../../../../domain/entity/login_input.dart';
import '../../bloc/login_cubit.dart';
import 'remember_me_checkbox_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email'),
            height8,
            TextFormField(
              controller: _emailTextController,
              validator: (email) {
                return getIt<LoginCubit>().validateEmail(email ?? '');
              },
              decoration: const InputDecoration()
                  .defaultThemeOf(context)
                  .copyWith(hintText: 'name@gmail.com'),
            ),
            height8,
            const Text('Password'),
            TextFormField(
              controller: _passwordTextController,
              obscureText: _obscureText,
              validator: (password) {
                return getIt<LoginCubit>().validatePassword(password ?? '');
              },
              decoration:
                  const InputDecoration().defaultThemeOf(context).copyWith(
                        errorMaxLines: 2,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                          ),
                        ),
                      ),
            ),
            height16,
            Row(
              children: [
                const RememberMeCheckboxWidget(),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: context.textTheme.labelSmall,
                  ),
                )
              ],
            ),
            height16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_loginFormKey.currentState?.validate() ?? false) {
                        final loginInput = LoginInput(
                          _emailTextController.text,
                          _passwordTextController.text,
                        );
                        await getIt<LoginCubit>().login(loginInput);
                      }
                    },
                    child: const Text('Sign in'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
