import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omt_base_project/router/router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {
          context.go(Routes.home.path);
        }, child: const Text('To home screen'),),
      ),
    );
  }
}
