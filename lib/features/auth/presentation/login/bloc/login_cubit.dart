import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_case/login_use_case.dart';
import 'login_state.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase) : super(const LoginState());

  final LoginUseCase _useCase;
}
