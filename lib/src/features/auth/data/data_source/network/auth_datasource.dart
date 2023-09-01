import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../base/data/models/base_response.dart';
import '../../../domain/entity/login_input.dart';
import '../models/login_model.dart';
import 'end_point.dart';

part 'auth_datasource.g.dart';

abstract class AuthDatasource {
  Future<BaseResponse<List<LoginModel>>> login(LoginInput input);
}

@Injectable(as: AuthDatasource)
@RestApi()
abstract class AuthDatasourceImpl implements AuthDatasource {
  @factoryMethod
  factory AuthDatasourceImpl(Dio dio) => _AuthDatasourceImpl(dio);

  @override
  @POST(loginPath)
  Future<BaseResponse<List<LoginModel>>> login(@Body() LoginInput input);
}
