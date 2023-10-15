import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/data/models/base_response.dart';
import '../../../../base/data/models/result.dart';
import '../../../../base/utils/api_utils.dart';
import '../../../../modules/router/router.dart';
import '../../domain/entity/user.dart';
import '../../domain/use_case/check_auth_use_case.dart';
import '../../domain/use_case/refresh_token_use_case.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._checkAuthUseCase, this._refreshTokenUseCase)
      : super(const AuthState());

  final CheckAuthUseCase _checkAuthUseCase;
  final RefreshTokenUseCase _refreshTokenUseCase;

  void checkAuth() {
    final result = _checkAuthUseCase.execute();
    emit(state.copyWith(loading: false));
    switch (result) {
      case Success<String, Exception>():
        emit(state.copyWith(authenticated: true));

      case Failure<String, Exception>():
        emit(state.copyWith(authenticated: false));
    }
  }

  Future<String?> refreshToken() async {
    final result = await _refreshTokenUseCase.execute();

    switch (result) {
      case Success<BaseResponse<String>, Exception>(value: final value):
        return value.data;
      case Failure<BaseResponse<String>, Exception>():
        emit(state.copyWith(authenticated: false));
        return null;
    }
  }
}
