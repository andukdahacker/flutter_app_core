import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app_core/base/data/data_source/local/storage_key.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_interceptor.dart';


@injectable
class AuthInterceptor extends BaseInterceptor {
  AuthInterceptor(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  @override
  int get priority => BaseInterceptor.accessTokenPriority;

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

    final accessToken = _sharedPreferences.getString(LocalStorageKey.token.name);

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }
}
