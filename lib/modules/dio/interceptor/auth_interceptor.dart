import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/data/data_source/local/storage_key.dart';
import '../../../features/auth/data/data_source/network/end_point.dart';
import '../../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../di/di.dart';
import 'base_interceptor.dart';

@injectable
class AuthInterceptor extends BaseInterceptor {
  AuthInterceptor(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('AuthInterceptor.onResponse ${response.headers} ${response.extra} ${response.toString()}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// Add access token to header before request
    const Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    options.headers.addAll(headers);

    if (options.path == refreshTokenPath || options.path == loginPath) {
      super.onRequest(options, handler);
    } else {
      final cancelToken = CancelToken();
      options.cancelToken = cancelToken;

      final accessToken =
          _sharedPreferences.getString(LocalStorageKey.token.name);

      if (accessToken != null && accessToken.isNotEmpty) {
        final jwt = JWT.decode(accessToken);

        final expiryDate = jwt.payload['exp'] as int?;

        if (expiryDate != null) {
          final expiryDateTime =
              DateTime.fromMillisecondsSinceEpoch(expiryDate * 1000);

          if (DateTime.now().isAfter(expiryDateTime)) {
            final authCubit = getIt<AuthCubit>();

            final result = await authCubit.refreshToken();

            if (result != null) {
              options.headers['Authorization'] = 'Bearer $result';
            } else {
              cancelToken.cancel('Cannot refresh token');
            }
          } else {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
        }
      }

      super.onRequest(options, handler);
    }
  }
}
