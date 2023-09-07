import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omt_base_project/router/router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.goNamed(Routes.login.name);
          },
          child: const Text('Back to home'),
        ),
      ),
    );
  }
}
