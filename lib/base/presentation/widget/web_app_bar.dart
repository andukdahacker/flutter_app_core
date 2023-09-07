import 'package:flutter/material.dart';

import 'adaptive_scaffold_widget.dart';
import 'theme_switch_widget.dart';

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WebAppBar({required this.height, super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AdaptiveWidgetBuilder(
        extraSmallScreenWidget: Row(
          children: [
            Icon(Icons.abc_rounded),
            ThemeSwitchWidget(),
            InkWell(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: Icon(Icons.menu),
            )
          ],
        ),
        smallScreenWidget: Row(
          children: [
            Icon(Icons.abc_rounded),
          ],
        ),
        mediumScreenWidget: Row(
          children: [
            Icon(Icons.abc_rounded),
          ],
        ),
        largeScreenWidget: Row(
          children: [
            Icon(Icons.abc_rounded),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
