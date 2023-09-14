import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../di/di.dart';
import 'interceptor/auth_interceptor.dart';
import 'interceptor/connectivity_interceptor.dart';

Dio initDioClient() {
  final dio = Dio();

  dio.options.baseUrl = 'http://localhost:4000';
  dio.options.connectTimeout = const Duration(seconds: 60);
  dio.options.receiveTimeout = const Duration(seconds: 60);

  dio.interceptors.addAll([
    getIt<AuthInterceptor>(),
    ConnectivityInterceptor(),
  ]);

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ),
  );

  if (!kIsWeb) {
    if (Platform.isAndroid || Platform.isIOS) {
      /// Allows https requests for older devices.
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final HttpClient client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;

        return client;
      };
    }
  }
  return dio;
}
