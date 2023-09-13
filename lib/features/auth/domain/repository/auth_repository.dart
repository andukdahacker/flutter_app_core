import '../entity/login_input.dart';
import '../use_case/check_auth_use_case.dart';
import '../use_case/login_use_case.dart';
import '../use_case/save_access_token_use_case.dart';

abstract class AuthRepository {
  Future<LoginOutput> login(
    LoginInput input,
  );

  CheckAuthOutput checkAuth();

  Future<SaveAccessTokenOutput> saveAccessToken(String token);
}
