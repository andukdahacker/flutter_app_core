import '../entity/login_input.dart';
import '../use_case/login_use_case.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();

  Future<LoginOutput> login(
    LoginInput input,
  );
}
