import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/data/models/base_response.dart';
import '../../../../../base/data/models/paginated.dart';
import '../../../../../base/exceptions/internal_server_exception.dart';
import '../../../domain/entity/job.dart';
import '../../../domain/entity/job_method.dart';
import '../../../domain/entity/job_type.dart';
import 'endpont.dart';
import 'input/search_job_input.dart';

abstract class HomeRemoteDatasource {
  Future<BaseResponse<Paginated<Job>>> searchJobs(String input);
}

@Injectable(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  HomeRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<BaseResponse<Paginated<Job>>> searchJobs(String input) async {
    final result = await _dio.get(searchJobPath,
        queryParameters:
            SearchJobInput(take: 10, fee: 100000, jobType: JobType.tutor.value, sortBy: 'asc', jobMethod: JobMethod.both.value, searchString: input).toJson());

    return BaseResponse.fromJson(result.data, (p0) => Paginated.fromJson(p0, (p1) => Job.fromJson(p1)));
  }
}
