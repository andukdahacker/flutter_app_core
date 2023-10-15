import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/data/models/base_response.dart';
import '../../../../../base/data/models/result.dart';
import '../../../../../base/presentation/bloc/bloc_utils.dart';
import '../../../../../base/utils/api_utils.dart';
import '../../../domain/entity/job.dart';
import '../../../domain/usecases/search_job_use_case.dart';
import 'home_search_event.dart';
import 'home_search_state.dart';

@lazySingleton
class HomeSearchBloc extends Bloc<HomeSearchEvent, HomeSearchState> {
  HomeSearchBloc(this._searchJobUseCase) : super(HomeSearchStateEmpty()) {
    on<SearchTextChanged>(_onSearchTextChanged,
        transformer: BlocUtils.debounce(const Duration(milliseconds: 500)));
  }

  final SearchJobUseCase _searchJobUseCase;

  Future<void> _onSearchTextChanged(
      SearchTextChanged event, Emitter<HomeSearchState> emit) async {
    final searchString = event.text;

    final result = await _searchJobUseCase.execute(searchString);

    switch (result) {
      case Success(value: final value):
        handleResponse(
            value, (successData) {
              if(successData.nodes.isEmpty) {
                emit(HomeSearchStateEmpty());
              } else {
                emit(SearchJobStateSuccess(successData.nodes));
              }
            });
        break;
      case Failure(
          exception: final exception,
          stackTrace: final stackTrace
        ):
        handleFailure(exception,
            stackTrace: stackTrace,
            onFailure: (exception) =>
                emit(const HomeSearchStateError('Search error')));
    }
  }
}
