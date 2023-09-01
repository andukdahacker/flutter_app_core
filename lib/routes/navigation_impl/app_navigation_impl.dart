import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' as m;
import 'package:injectable/injectable.dart';
import '../../base/domain/navigation/app_navigation.dart';
import '../../base/domain/navigation/app_popup_info.dart';
import '../../base/presentation/widgets/view_utils.dart';
import '../app_route/app_routes.dart';
import 'mapper/app_popup_info_mapper.dart';

@LazySingleton(as: AppNavigator)
class AppNavigationImpl extends AppNavigator {
  AppNavigationImpl(
    this._appRouter,
    this._appPopupInfoMapper,
  );

  final AppRouter _appRouter;
  final AppPopupInfoMapper _appPopupInfoMapper;

  TabsRouter? tabsRouter;
  final _popups = <AppPopupInfo>{};

  StackRouter? get _currentTabRouter =>
      tabsRouter?.stackRouterOfIndex(currentBottomTab);

  StackRouter get _currentTabRouterOrRootRouter =>
      _currentTabRouter ?? _appRouter;

  m.BuildContext get _rootRouterContext {
    return _appRouter.navigatorKey.currentContext!;
  }

  m.BuildContext? get _currentTabRouterContext =>
      _currentTabRouter?.navigatorKey.currentContext;

  m.BuildContext get _currentTabContextOrRootContext =>
      _currentTabRouterContext ?? _rootRouterContext;

  @override
  bool get canPopSelfOrChildren => _appRouter.canPop();

  @override
  int get currentBottomTab {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    return tabsRouter?.activeIndex ?? 0;
  }

  @override
  String getCurrentRouteName({bool useRootNavigator = false}) => AutoRouter.of(
        useRootNavigator ? _rootRouterContext : _currentTabContextOrRootContext,
      ).current.name;

  @override
  void navigateToBottomTab(int index, {bool notify = true}) {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }
    tabsRouter?.setActiveIndex(index, notify: notify);
  }

  @override
  Future<bool> pop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  }) {
    return useRootNavigator
        ? _appRouter.pop<T>(result)
        : _currentTabRouterOrRootRouter.pop<T>(result);
  }

  @override
  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    PageRouteInfo<dynamic> pageRouteInfo, {
    R? result,
    bool useRootNavigator = false,
  }) {
    return useRootNavigator
        ? _appRouter.popAndPush<T, R>(pageRouteInfo, result: result)
        : _currentTabRouterOrRootRouter.popAndPush<T, R>(
            pageRouteInfo,
            result: result,
          );
  }

  @override
  Future<void> popAndPushAll(
    List<PageRouteInfo<dynamic>> listPageRouteInfo, {
    bool useRootNavigator = false,
  }) {
    return useRootNavigator
        ? _appRouter.popAndPushAll(listPageRouteInfo)
        : _currentTabRouterOrRootRouter.popAndPushAll(listPageRouteInfo);
  }

  @override
  void popUntilRoot({bool useRootNavigator = false}) {
    useRootNavigator
        ? _appRouter.popUntilRoot()
        : _currentTabRouterOrRootRouter.popUntilRoot();
  }

  @override
  void popUntilRootOfCurrentBottomTab() {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    if (_currentTabRouter?.canPop() == true) {
      _currentTabRouter?.popUntilRoot();
    }
  }

  @override
  void popUntilRouteName(String routeName) {
    _appRouter.popUntilRouteWithName(routeName);
  }

  @override
  Future<T?> push<T extends Object?>(PageRouteInfo<dynamic> pageRouteInfo) {
    return _appRouter.push<T>(pageRouteInfo);
  }

  @override
  Future<void> pushAll(List<PageRouteInfo<dynamic>> listPageRouteInfo) {
    return _appRouter.pushAll(listPageRouteInfo);
  }

  @override
  bool removeAllRoutesWithName(String routeName) {
    return _appRouter.removeWhere((route) => route.name == routeName);
  }

  @override
  bool removeLast() {
    return _appRouter.removeLast();
  }

  @override
  bool removeUntilRouteName(String routeName) {
    return _appRouter.removeUntil((route) => route.name == routeName);
  }

  @override
  Future<T?> replace<T extends Object?>(PageRouteInfo pageRouteInfo) {
    return _appRouter.replace<T>(pageRouteInfo);
  }

  @override
  Future<void> replaceAll(List<PageRouteInfo<dynamic>> listPageRouteInfo) {
    return _appRouter.replaceAll(listPageRouteInfo);
  }

  @override
  Future<T?> showDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  }) {
    if (_popups.contains(appPopupInfo)) {
      return Future.value(null);
    }
    _popups.add(appPopupInfo);

    return m.showDialog<T>(
      context: useRootNavigator
          ? _rootRouterContext
          : _currentTabContextOrRootContext,
      builder: (_) => m.WillPopScope(
        onWillPop: () async {
          _popups.remove(appPopupInfo);

          return Future.value(true);
        },
        child: _appPopupInfoMapper.map(appPopupInfo, this),
      ),
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
    );
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {
    ViewUtils.showAppSnackBar(
      _rootRouterContext,
      message,
      duration: duration,
      // backgroundColor: AppColors.current.primaryColor,
    );
  }

  @override
  Future<T?> showGeneralDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    m.Widget Function(
      m.BuildContext p1,
      m.Animation<double> p2,
      m.Animation<double> p3,
      m.Widget p4,
    )? transitionBuilder,
    Duration transitionDuration = const Duration(milliseconds: 200),
    bool barrierDismissible = true,
    m.Color barrierColor = const m.Color(0x80000000),
    bool useRootNavigator = true,
  }) {
    if (_popups.contains(appPopupInfo)) {
      return Future.value(null);
    }
    _popups.add(appPopupInfo);

    return m.showGeneralDialog<T>(
      context: useRootNavigator
          ? _rootRouterContext
          : _currentTabContextOrRootContext,
      barrierColor: barrierColor,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      pageBuilder: (
        m.BuildContext context,
        m.Animation<double> animation1,
        m.Animation<double> animation2,
      ) {
        return m.WillPopScope(
          onWillPop: () async {
            _popups.remove(appPopupInfo);

            return Future.value(true);
          },
          child: _appPopupInfoMapper.map(appPopupInfo, this),
        );
      },
      transitionBuilder: transitionBuilder,
      transitionDuration: transitionDuration,
    );
  }

  @override
  Future<T?> showModalBottomSheet<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    m.Color barrierColor = m.Colors.black54,
    m.Color? backgroundColor,
  }) {
    return m.showModalBottomSheet<T>(
      context: useRootNavigator
          ? _rootRouterContext
          : _currentTabContextOrRootContext,
      builder: (_) => _appPopupInfoMapper.map(appPopupInfo, this),
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useRootNavigator: useRootNavigator,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
    );
  }

  @override
  void showSuccessSnackBar(String message, {Duration? duration}) {
    ViewUtils.showAppSnackBar(
      _rootRouterContext,
      message,
      duration: duration,
      // backgroundColor: AppColors.current.primaryColor,
    );
  }
}
