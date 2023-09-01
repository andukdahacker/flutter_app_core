import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../modules/di/di.dart';
import '../../local/local_storage_manager.dart';
import 'base_interceptor.dart';

@injectable
class AuthInterceptors extends BaseInterceptor {
  final _localStorage = getIt.get<LocalStorageManager>();

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

    final accessToken = await _localStorage.read(LocalStorageKey.token);

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }
}
