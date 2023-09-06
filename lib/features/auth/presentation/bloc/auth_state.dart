import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.authenticated(String token) = Authenticated;

  const factory AuthState.unauthenticated() = Unauthenticated;
}
