import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/login_data.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial({
    String? email,
    String? password,
    @Default(false) rememberMe,
  }) = LoginInitial;

  const factory LoginState.loading() = LoginLoading;

  const factory LoginState.failed() = LoginFailed;

  const factory LoginState.success(LoginData loginData) = LoginSuccess;
}
