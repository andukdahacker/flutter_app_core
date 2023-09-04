import 'package:injectable/injectable.dart';

import '../../../../../base/presentation/bloc/base_cubit.dart';
import '../../../domain/use_case/login_use_case.dart';
import 'login_state.dart';

@lazySingleton
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._useCase) : super(const LoginState());

  final LoginUseCase _useCase;
}
