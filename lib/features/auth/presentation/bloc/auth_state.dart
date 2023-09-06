part of 'auth_cubit.dart';


@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({@Default(true) loading, @Default(false) authenticated}) = _AuthState;
}