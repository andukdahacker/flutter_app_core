import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Home page'),
            TextButton(
                onPressed: () {
                  context.go('/home/profile');
                },
                child: const Text('To profile screen')),
          ],
        ),
      ),
    );
  }
}
