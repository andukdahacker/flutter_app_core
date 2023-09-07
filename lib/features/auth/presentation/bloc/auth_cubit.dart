import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/data/models/result.dart';
import '../../../../router/router.dart';
import '../../domain/use_case/check_auth_use_case.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._checkAuthUseCase) : super(const AuthState());

  final CheckAuthUseCase _checkAuthUseCase;

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
  void toggleLoading() {
    emit(state.copyWith(loading: !state.loading));
  }
}
