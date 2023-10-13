import 'package:injectable/injectable.dart';

import '../../../../base/data/models/result.dart';
import '../../domain/repository/home_repository.dart';
import '../../domain/usecases/search_job_use_case.dart';
import '../datasource/remote/home_remote_datasource.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._remoteDatasource);

  final HomeRemoteDatasource _remoteDatasource;

  @override
  Future<SearchJobOutput> searchJob(String input) async {
    try {
      final response = await _remoteDatasource.searchJobs(input);

      return Success(response);
    } on Exception catch (e, trace) {
      return Failure(e, stackTrace: trace);
    }
  }
}
