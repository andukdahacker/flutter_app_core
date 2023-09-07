import 'package:flutter/material.dart';

import '../extension/context_screen_size.dart';

class AdaptiveWidgetBuilder extends StatelessWidget {
  const AdaptiveWidgetBuilder(
      {required this.extraSmallScreenWidget,
      required this.mediumScreenWidget,
      required this.smallScreenWidget,
      required this.largeScreenWidget,
      super.key});

  final Widget extraSmallScreenWidget;
  final Widget smallScreenWidget;
  final Widget mediumScreenWidget;
  final Widget largeScreenWidget;

  @override
  Widget build(BuildContext context) {
    if (context.isExtraSmallScreen) {
      return extraSmallScreenWidget;
    } else if (context.isSmallScreen) {
      return smallScreenWidget;
    } else if (context.isMediumScreen) {
      return mediumScreenWidget;
    } else if (context.isLargeScreen) {
      return largeScreenWidget;
    }

    return const SizedBox.shrink();
  }
}
