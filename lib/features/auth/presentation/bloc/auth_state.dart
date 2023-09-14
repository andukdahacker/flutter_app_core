part of 'auth_cubit.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState(
      {@Default(true) bool loading,
      @Default(false) bool authenticated,
      User? user}) = _AuthState;
}
