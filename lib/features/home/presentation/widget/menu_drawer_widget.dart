import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../base/presentation/widget/theme_switch_widget.dart';

class MenuDrawerWidget extends StatelessWidget {
  const MenuDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text('Your Profile'),
              onTap: () {
                context.go('/profile');
              },
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {},
            ),
            const ThemeSwitchWidget(),
          ],
        ),
      );
  }
}
