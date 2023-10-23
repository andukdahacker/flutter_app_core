import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../base/data/models/base_response.dart';
import '../../../../../../base/data/models/paginated.dart';
import '../../../../../../base/data/models/result.dart';
import '../../../../../../base/utils/api_utils.dart';
import '../../../../domain/entity/search_tutor_input.dart';
import '../../../../domain/entity/tutor.dart';
import '../../../../domain/usecases/search_tutor_use_case.dart';
import '../job/search_job_state.dart';
import 'search_tutor_event.dart';
import 'search_tutor_state.dart';

@lazySingleton
class SearchTutorBloc extends Bloc<SearchTutorEvent, SearchTutorState> {
  SearchTutorBloc(this._searchTutorUseCase) : super(const SearchTutorStateEmpty()) {
    on<SearchTutorTextChanged>(_onSearchTutorTextChanged);
  }

  final SearchTutorUseCase _searchTutorUseCase;

  Future<void> _onSearchTutorTextChanged(
      SearchTutorTextChanged event, Emitter<SearchTutorState> emit) async {
    final searchString = event.text;

    final result = await _searchTutorUseCase
        .execute(SearchTutorInput(searchString: searchString, take: 10));

    emit(const SearchTutorStateLoading());

    switch (result) {
      case Success<BaseResponse<Paginated<Tutor>>, Exception>(
          value: final value
        ):
        handleResponse(value, (successData) {
          if (successData.nodes.isEmpty) {
            emit(const SearchTutorStateEmpty());
          } else {
            emit(SearchTutorStateSuccess(successData.nodes));
          }
        });
      case Failure<BaseResponse<Paginated<Tutor>>, Exception>(
          exception: final exception,
          stackTrace: final stackTrace
        ):
        handleFailure(exception,
            stackTrace: stackTrace,
            onFailure: (exception) =>
                emit(const SearchTutorStateError('Search tutor error')));
    }
  }
}
