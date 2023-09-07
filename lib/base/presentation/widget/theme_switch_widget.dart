import 'package:flutter/material.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
    return Switch(value: light, onChanged: (value) {
      setState(() {
        light = value;
      });
    });
  }
}
