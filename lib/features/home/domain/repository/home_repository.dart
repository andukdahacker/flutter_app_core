import '../entity/search_subject_input.dart';
import '../entity/search_tutor_input.dart';
import '../usecases/search_job_use_case.dart';
import '../usecases/search_subject_use_case.dart';
import '../usecases/search_tutor_use_case.dart';

abstract class HomeRepository {
  Future<SearchJobOutput> searchJob(String input);

  Future<SearchTutorOutput> searchTutor(SearchTutorInput input);

  Future<SearchSubjectOutput> searchSubject(SearchSubjectInput input);
}
