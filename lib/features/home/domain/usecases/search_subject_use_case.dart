import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../base/data/models/base_response.dart';
import '../../../../base/data/models/paginated.dart';
import '../../../../base/data/models/result.dart';
import '../../../../base/domain/base_use_case.dart';
import '../entity/search_subject_input.dart';
import '../entity/subject.dart';
import '../repository/home_repository.dart';

typedef SearchSubjectOutput
    = Result<BaseResponse<Paginated<Subject>>, Exception>;

@injectable
class SearchSubjectUseCase
    extends UseCase<SearchSubjectInput, SearchSubjectOutput> {
  SearchSubjectUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  FutureOr<SearchSubjectOutput> execute(SearchSubjectInput input) async {
    return await _homeRepository.searchSubject(input);
  }
}
