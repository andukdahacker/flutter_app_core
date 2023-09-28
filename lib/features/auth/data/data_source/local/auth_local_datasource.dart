import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../base/data/data_source/local/storage_key.dart';
import '../../../../../base/exceptions/internal_server_exception.dart';
import '../../../../../base/exceptions/unauthenticated_exception.dart';
import '../../../../../modules/db/db.dart';
import '../../../domain/entity/user.dart';

abstract class AuthLocalDatasource {
  String checkAuth();

  Future<String> saveAccessToken(String token);

  Future<User> saveUser(User user);
}

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  AuthLocalDatasourceImpl(this._sharedPreferences, this._database);

  final SharedPreferences _sharedPreferences;
  final AppDatabase _database;

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
    final result =
        await _sharedPreferences.setString(LocalStorageKey.token.name, token);

    if (result) {
      return token;
    }

    throw InternalServerException(message: 'Error saving access token');
  }

  @override
  Future<User> saveUser(User user) async {
    final userInsertResult =
        await _database.into(_database.userTable).insertReturning(
              UserTableCompanion.insert(
                id: user.id ?? '',
                username: user.username ?? '',
                email: user.email ?? '',
                isVerified: user.isVerified ?? false,
                avatar: Value(user.avatar),
              ),
            );

    return User.fromDb(userInsertResult);
  }
}
