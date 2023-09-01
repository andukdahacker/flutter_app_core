import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../di/di.dart';
import '../../features/auth/domain/use_case/is_logged_in_use_case.dart';
import '../../features/auth/presentation/login/login_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../middleware/route_guard.dart';

part 'app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({GlobalKey<NavigatorState>? navigationKey})
      : super(navigatorKey: navigationKey);

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          guards: [RouteGuard(getIt.get<IsLoggedInUseCase>())],
        ),
        AutoRoute(page: LoginRoute.page),
      ];
}
