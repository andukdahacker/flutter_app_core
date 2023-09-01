import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../src/base/data/data_source/network/dio_client.dart';

@module
abstract class DioInjection {
  Dio dio() => initDioClient();
}
