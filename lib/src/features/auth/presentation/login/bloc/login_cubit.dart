import 'package:injectable/injectable.dart';

import '../../../../../base/presentation/bloc/base_cubit.dart';
import '../../../../../routes/app_route/app_routes.dart';
import '../../../domain/entity/login_input.dart';
import '../../../domain/use_case/login_use_case.dart';
import 'login_state.dart';

@lazySingleton
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._useCase) : super(const LoginState());

  final LoginUseCase _useCase;

  Future<void> login() async {
    await consumeState(
      () => _useCase.execute(
        LoginInput('username', 'password'),
      ),
      onSuccess: (successData) {
        navigation.replace(HomeRoute());
      },
    );
  }
}
