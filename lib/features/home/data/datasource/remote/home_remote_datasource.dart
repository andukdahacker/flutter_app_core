import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/data/models/base_response.dart';
import '../../../../../base/exceptions/internal_server_exception.dart';
import '../../../domain/entity/job.dart';
import 'endpont.dart';
import 'input/search_job_input.dart';

abstract class HomeRemoteDatasource {
  Future<BaseResponse<List<Job>>> searchJobs(String input);
}

@Injectable(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  HomeRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<BaseResponse<List<Job>>> searchJobs(String input) async {
    final result = await _dio.get(searchJobPath,
        queryParameters:
            SearchJobInput(take: 10, searchString: input).toJson());

    return BaseResponse.fromJson(result.data, (p0) => (p0 as List).map((e) => Job.fromJson(e)).toList());
  }
}
