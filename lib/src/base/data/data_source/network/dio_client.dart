import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../../configs/app_flavor.dart';
import '../../../../../modules/di/di.dart';
import 'interceptor/auth_interceptor.dart';
import 'interceptor/connectivity_interceptor.dart';

Dio initDioClient() {
  final flavor = getIt.get<FlavorConfig>();
  final dio = Dio();

  if (Platform.isAndroid || Platform.isIOS) {
    /// Allows https requests for older devices.
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return client;
    };
  }
  dio.options.baseUrl = flavor.values.baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 60);
  dio.options.receiveTimeout = const Duration(seconds: 60);

  dio.interceptors.addAll([
    AuthInterceptors(),
    ConnectivityInterceptor(),
  ]);

  if (flavor.flavor != Flavor.prod) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }

  return dio;
}
