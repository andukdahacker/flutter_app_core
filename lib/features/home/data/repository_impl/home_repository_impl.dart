import 'dart:html';

import 'package:injectable/injectable.dart';

import '../../../../base/data/models/result.dart';
import '../../domain/entity/search_subject_input.dart';
import '../../domain/entity/search_tutor_input.dart';
import '../../domain/repository/home_repository.dart';
import '../../domain/usecases/search_job_use_case.dart';
import '../../domain/usecases/search_subject_use_case.dart';
import '../../domain/usecases/search_tutor_use_case.dart';
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

  @override
  Future<SearchTutorOutput> searchTutor(SearchTutorInput input) async {
    try {
      final response = await _remoteDatasource.searchTutor(input);

      return Success(response);
    } on Exception catch (e, trace) {
      return Failure(e, stackTrace: trace);
    }
  }

  @override
  Future<SearchSubjectOutput> searchSubject(SearchSubjectInput input) async {
    try {
      final response = await _remoteDatasource.searchSubject(input);

      return Success(response);
    } on Exception catch (e, trace) {
      return Failure(e, stackTrace: trace);
    }
  }
}
