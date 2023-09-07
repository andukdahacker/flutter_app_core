import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../dio/dio_client.dart';

@module
abstract class DioInjection {
  Dio dio() => initDioClient();
}
