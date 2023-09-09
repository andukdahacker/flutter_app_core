import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omt_base_project/router/router.dart';

import '../../../../../base/presentation/extension/context_screen_size.dart';
import '../../../../../base/presentation/widget/adaptive_scaffold_widget.dart';
import '../../../../../base/presentation/widget/web_app_bar.dart';
import '../../../../../modules/di/di.dart';
import '../../bloc/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WebAppBar(height: context.screenHeight),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: AdaptiveWidgetBuilder(
        extraSmallScreenWidget: Center(
          child: Column(
            children: [
              Text(
                'Extra small',
                style: TextStyle(color: Colors.white),
              ),
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
