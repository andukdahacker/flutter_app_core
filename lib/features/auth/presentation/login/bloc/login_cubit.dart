import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/data/models/base_response.dart';
import '../../../../../base/data/models/result.dart';
import '../../../../../base/utils/api_utils.dart';
import '../../../domain/entity/login_data.dart';
import '../../../domain/entity/login_input.dart';
import '../../../domain/use_case/login_use_case.dart';
import 'login_state.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  final LoginUseCase _loginUseCase;

  Future<void> login(LoginInput loginInput) async {
    emit(const LoginState.loading());
    final result = await _loginUseCase.execute(loginInput);

    switch (result) {
      case Success<BaseResponse<LoginData>, Exception>(value: final value):
        handleResponse(value, (successData) async {

          emit(LoginState.success(successData));
        });
      case Failure<BaseResponse<LoginData>, Exception>(
          exception: final exception,
          stackTrace: final stackTrace
        ):
        handleFailure(exception, stackTrace: stackTrace,
            onFailure: (exception) {
          emit(const LoginState.failed());
        });
    }
  }
}
