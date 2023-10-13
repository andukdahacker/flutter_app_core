import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/data/models/base_response.dart';
import '../../../domain/entity/login_data.dart';
import '../../../domain/entity/login_input.dart';
import 'end_point.dart';

abstract class AuthRemoteDatasource {
  Future<BaseResponse<LoginData>> login(LoginInput input);
  Future<BaseResponse<String>> refreshToken();
}

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<BaseResponse<LoginData>> login(LoginInput input) async {
    final result = await _dio.post(loginPath, data: input.toJson());

    return BaseResponse.fromJson(
        result.data, (p0) => LoginData.fromJson(p0 as Map<String, dynamic>));
  }

  @override
  Future<BaseResponse<String>> refreshToken() async {
    final result = await _dio.post(refreshTokenPath);

    return BaseResponse.fromJson(result.data, (p0) => p0 as String);
  }
}
