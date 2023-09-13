import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../base/data/data_source/local/storage_key.dart';
import '../../../../../base/exceptions/internal_server_exception.dart';
import '../../../../../base/exceptions/unauthenticated_exception.dart';

abstract class AuthLocalDatasource {
  String checkAuth();
  Future<String> saveAccessToken(String token);
}

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  AuthLocalDatasourceImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  String checkAuth() {
    final token = _sharedPreferences.getString(LocalStorageKey.token.name);

    if (token != null && token.isNotEmpty) {
      return token;
    }

    throw UnauthenticatedException();
  }

  @override
  Future<String> saveAccessToken(String token) async {
    final result = await _sharedPreferences.setString(LocalStorageKey.token.name, token);

    if(result) {
      return token;
    }

    throw InternalServerException(message: 'Error saving access token');
  }
}
