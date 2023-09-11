import 'package:flutter/material.dart';
import 'package:flutter_app_core/base/presentation/theme/app_color.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../extension/context_theme.dart';
import '../resources/asset_paths/icons_paths.dart';
import 'adaptive_scaffold_widget.dart';
import 'spacing_widgets.dart';
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
            width8,
            SvgPicture.asset(IconPaths.icLogo),
            width8,
            Text(
              'SPARKLE',
              style: context.textTheme.displaySmall?.copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            const ThemeSwitchWidget(),
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
