import 'package:flutter/material.dart';

import '../../../app/app_cubit.dart';
import '../../../modules/di/di.dart';
import '../extension/context_theme.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  late bool light;

  @override
  void didChangeDependencies() {
    setState(() {
      light = context.isLightMode;
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Switch(value: light, onChanged: (value) {
      setState(() {
        light = value;
      });

        getIt<AppCubit>().changeTheme(light ? ThemeMode.light : ThemeMode.dark);
    });
  }
}
