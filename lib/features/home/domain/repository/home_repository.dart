import '../usecases/search_job_use_case.dart';

abstract class HomeRepository {
  Future<SearchJobOutput> searchJob(String input);
}
