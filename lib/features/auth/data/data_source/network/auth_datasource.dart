import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/data/models/base_response.dart';
import '../../../domain/entity/login_input.dart';
import '../models/login_model.dart';
import 'end_point.dart';

abstract class AuthDatasource {
  Future<BaseResponse<LoginModel>> login(LoginInput input);
}

@Injectable(as: AuthDatasource)
class AuthDatasourceImpl implements AuthDatasource {
  AuthDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<BaseResponse<LoginModel>> login(LoginInput input) async {
    final result = await _dio.post(loginPath, data: input.toJson());

    return BaseResponse.fromJson(
        result.data, (p0) => LoginModel.fromJson(p0 as Map<String, dynamic>));
  }
}
