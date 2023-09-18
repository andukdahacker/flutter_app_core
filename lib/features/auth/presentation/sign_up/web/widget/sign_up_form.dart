import 'package:flutter/material.dart';
import '../../../../../../base/presentation/extension/extension.dart';
import '../../../../../../base/presentation/widget/spacing_widgets.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
              height8,
              TextFormField(
                controller: _usernameTextController,
              ),
              height16,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
              height8,
              TextFormField(
                controller: _emailTextController,
              ),
              height16,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
              height8,
              TextFormField(
                controller: _passwordTextController,
                obscureText: _obscureText,
                decoration:
                    const InputDecoration().defaultThemeOf(context).copyWith(
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
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Sign up',
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
