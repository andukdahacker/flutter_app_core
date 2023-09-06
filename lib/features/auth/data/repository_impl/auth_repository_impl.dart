import 'package:injectable/injectable.dart';

import '../../../../base/data/models/result.dart';
import '../../domain/entity/login_input.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/use_case/check_auth_use_case.dart';
import '../../domain/use_case/login_use_case.dart';
import '../data_source/local/auth_local_datasource.dart';
import '../data_source/network/auth_remote_datasource.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    this._networkDatasource,
    this._authLocalDatasource,
  );

  final AuthRemoteDatasource _networkDatasource;
  final AuthLocalDatasource _authLocalDatasource;

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
  CheckAuthOutput checkAuth() {
    try {
      final token = _authLocalDatasource.checkAuth();

      return Success(token);
    } on Exception catch (e, trace) {
      return Failure(e, stackTrace: trace);
    }
  }
}
