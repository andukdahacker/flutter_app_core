import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/data/models/base_response.dart';
import '../../../../../base/data/models/result.dart';
import '../../../../../base/utils/api_utils.dart';
import '../../../../../modules/router/router.dart';
import '../../../domain/entity/login_data.dart';
import '../../../domain/entity/login_input.dart';
import '../../../domain/use_case/login_use_case.dart';
import '../../../domain/use_case/save_access_token_use_case.dart';
import '../../../domain/use_case/validate_email_use_case.dart';
import '../../../domain/use_case/validate_password_use_case.dart';
import 'login_state.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginUseCase,
    this._saveAccessTokenUseCase,
    this._validateEmailUseCase,
    this._validatePasswordUseCase,
  ) : super(const LoginState.initial()) {}

  final LoginUseCase _loginUseCase;
  final SaveAccessTokenUseCase _saveAccessTokenUseCase;
  final ValidateEmailUseCase _validateEmailUseCase;
  final ValidatePasswordUseCase _validatePasswordUseCase;

  Future<void> login(LoginInput loginInput) async {
    if (state is LoginLoading) {
      return;
    }

    emit(const LoginState.loading());

    final result = await _loginUseCase.execute(loginInput);

    switch (result) {
      case Success<BaseResponse<LoginData>, Exception>(value: final value):
        handleResponse(value, (successData) async {
          final saveAccessTokenResult =
              await saveAccessToken(successData.accessToken ?? '');
          if (saveAccessTokenResult) {
            emit(LoginState.success(successData));
          } else {
            emit(const LoginState.failed());
          }
        });

      case Failure<BaseResponse<LoginData>, Exception>(
          exception: final exception,
          stackTrace: final stackTrace
        ):
        handleFailure(exception, stackTrace: stackTrace,
            onFailure: (exception) {
          emit(const LoginState.failed(message: 'Log in failed'));
        });
    }
  }

  Future<bool> saveAccessToken(String token) async {
    final result = await _saveAccessTokenUseCase.execute(token);

    switch (result) {
      case Success<String, Exception>():
        return true;
      case Failure<String, Exception>(
          exception: final exception,
          stackTrace: final trace
        ):
        handleFailure(exception, stackTrace: trace);
        return false;
    }
  }

  String? validateEmail(String email) {
    return _validateEmailUseCase.execute(email);
  }

  String? validatePassword(String password) {
    return _validatePasswordUseCase.execute(password);
  }
}
