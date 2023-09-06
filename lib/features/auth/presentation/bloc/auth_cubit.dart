import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/data/models/result.dart';
import '../../../../base/utils/api_utils.dart';
import '../../domain/use_case/check_auth_use_case.dart';
import 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._checkAuthUseCase) : super(const AuthState.loading()) {
    checkAuth();
  }

  final CheckAuthUseCase _checkAuthUseCase;

  void checkAuth() {
    final result = _checkAuthUseCase.execute();

    return switch (result) {
      Success<String, Exception>(value: final value) =>
        emit(AuthState.authenticated(value)),
      Failure<String, Exception>(
        exception: final exception,
        stackTrace: final stackTrace
      ) =>
        handleFailure(
          exception,
          stackTrace: stackTrace,
          onFailure: (exception) {
            emit(const AuthState.unauthenticated());
          },
        ),
    };
  }
}
