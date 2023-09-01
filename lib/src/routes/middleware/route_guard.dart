import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import '../../features/auth/domain/use_case/is_logged_in_use_case.dart';
import '../../helper/run_catching/run_catching.dart';
import '../app_route/app_routes.dart';

@Injectable()
class RouteGuard extends AutoRouteGuard {
  RouteGuard(this._isLoggedInUseCase);

  final IsLoggedInUseCase _isLoggedInUseCase;

  Future<bool> get _isLoggedIn async => runAsyncCatching(
        action: () => _isLoggedInUseCase.execute(const IsLoggedInInput()),
      ).then(
        (output) => output.when(
          success: (value) => value.isLoggedIn,
          failure: (e) => false,
        ),
        onError: (e) => false,
      );

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final _loggedIn = await _isLoggedIn;
    if (_loggedIn) {
      resolver.next(true);
    } else {
      await router.root.replace(LoginRoute());
      resolver.next(false);
    }
  }
}
