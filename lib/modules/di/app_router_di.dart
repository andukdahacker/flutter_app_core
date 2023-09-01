import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../src/routes/app_route/app_routes.dart';

@module
abstract class RouterInjection {
  AppRouter router() => AppRouter(navigationKey: navigationKey);
}

final navigationKey = GlobalKey<NavigatorState>(debugLabel: 'myKey');
