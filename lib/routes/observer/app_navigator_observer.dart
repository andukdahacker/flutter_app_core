import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  AppNavigatorObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (kDebugMode) {
      debugPrint('didPush from ${previousRoute?.settings.name} to ${route.settings.name}');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (kDebugMode) {
      debugPrint('didPop ${route.settings.name}, back to ${previousRoute?.settings.name}');
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    if (kDebugMode) {
      debugPrint('didRemove ${route.settings.name}, back to ${previousRoute?.settings.name}');
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (kDebugMode) {
      debugPrint('didReplace ${oldRoute?.settings.name} by ${newRoute?.settings.name}');
    }
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
}
