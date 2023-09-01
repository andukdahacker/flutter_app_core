import 'package:injectable/injectable.dart';

import '../../../../base/data/data_source/local/local_storage_manager_impl.dart';
import '../../../../base/data/models/result.dart';
import '../../domain/entity/login_input.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/use_case/login_use_case.dart';
import '../data_source/network/auth_datasource.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._networkDatasource, this._localStorage);

  final AuthDatasource _networkDatasource;
  final SecureStorageManager _localStorage;

  @override
  Future<LoginOutput> login(LoginInput input) async {
    try {
      final response = await _networkDatasource.login(input);

      return Success(response);
    } on Exception catch (e, stackTrace) {
      return Failure(
        e,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final isLoggedIn = await _localStorage.read(LocalStorageKey.token);
    return isLoggedIn != null;
  }
}
