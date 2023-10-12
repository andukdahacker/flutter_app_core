import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../modules/router/router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.goNamed(Routes.home.name);
          },
          child: const Text('Back to home'),
        ),
      ),
    );
  }
}
