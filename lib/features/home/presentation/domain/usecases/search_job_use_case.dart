import 'dart:async';

import '../../../../../base/data/models/result.dart';
import '../../../../../base/domain/base_use_case.dart';
import '../entity/job.dart';
import '../repository/home_repository.dart';

typedef SearchJobOutput = Result<List<Job>, Exception>;

class SearchJobUseCase extends UseCase<String, SearchJobOutput> {
  SearchJobUseCase(this._homeRepository);
  final HomeRepository _homeRepository;
  @override
  FutureOr<SearchJobOutput> execute(String input) async {
    return await _homeRepository.searchJob(input);
  }
}
