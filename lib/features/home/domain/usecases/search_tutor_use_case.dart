import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../base/data/models/base_response.dart';
import '../../../../base/data/models/paginated.dart';
import '../../../../base/data/models/result.dart';
import '../../../../base/domain/base_use_case.dart';
import '../entity/search_tutor_input.dart';
import '../entity/tutor.dart';
import '../repository/home_repository.dart';

typedef SearchTutorOutput = Result<BaseResponse<Paginated<Tutor>>, Exception>;

@injectable
class SearchTutorUseCase extends UseCase<SearchTutorInput, SearchTutorOutput> {
  SearchTutorUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  FutureOr<SearchTutorOutput> execute(SearchTutorInput input) async {
    return await _homeRepository.searchTutor(input);
  }
}
