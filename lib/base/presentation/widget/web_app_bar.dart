import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../features/auth/presentation/bloc/auth_cubit.dart';
import '../extension/context_theme.dart';
import '../extension/extension.dart';
import '../resources/asset_paths/icons_paths.dart';
import '../theme/app_color.dart';
import 'search_bar_widget.dart';
import 'spacing_widgets.dart';
import 'theme_switch_widget.dart';

class AppBarWebWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWebWidget({required this.height, super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.authenticated != current.authenticated,
      builder: (context, state) {
        if (!state.authenticated) {
          return Row(
            children: [
              width8,
              SvgPicture.asset(IconPaths.icLogo),
              width8,
              Text(
                'SPARKLE',
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColor.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              const ThemeSwitchWidget(),
            ],
          );
        }

        return const _AuthenticatedAppBarWebWidget();
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AuthenticatedAppBarWebWidget extends StatelessWidget {
  const _AuthenticatedAppBarWebWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            width8,
            SvgPicture.asset(IconPaths.icLogo),
            width16,
            const Spacer(),
            width16,
            ElevatedButton(onPressed: () {}, child: Text('Create a job')),
            const Row(
              children: [
                Icon(
                  Icons.chat_bubble_outline_rounded,
                ),
                width16,
                Icon(
                  Icons.notifications_none_rounded,
                ),
                width16,
                Icon(Icons.menu_rounded)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
