import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../base/data/models/base_response.dart';
import '../../../../../../base/data/models/paginated.dart';
import '../../../../../../base/data/models/result.dart';
import '../../../../../../base/presentation/bloc/bloc_utils.dart';
import '../../../../../../base/utils/api_utils.dart';
import '../../../../domain/entity/job.dart';
import '../../../../domain/entity/search_tutor_input.dart';
import '../../../../domain/entity/tutor.dart';
import '../../../../domain/usecases/search_job_use_case.dart';
import '../../../../domain/usecases/search_tutor_use_case.dart';
import '../../../widget/search_bar_widget.dart';
import 'search_job_event.dart';
import 'search_job_state.dart';

@lazySingleton
class SearchJobBloc extends Bloc<SearchJobEvent, SearchJobState> {
  SearchJobBloc(this._searchJobUseCase)
      : super(SearchJobStateEmpty()) {
    on<SearchJobTextChanged>(_onSearchTextChanged,
        transformer: BlocUtils.debounce(const Duration(milliseconds: 500)));
  }

  final SearchJobUseCase _searchJobUseCase;

  Future<void> _onSearchTextChanged(
      SearchJobTextChanged event, Emitter<SearchJobState> emit) async {
    final searchString = event.text;
    final result = await _searchJobUseCase.execute(searchString);

    emit(const SearchJobStateLoading());
    switch (result) {
      case Success(value: final value):
        handleResponse(value, (successData) {
          if (successData.nodes.isEmpty) {
            emit(SearchJobStateEmpty());
          } else {
            emit(SearchJobStateSuccess(successData.nodes));
          }
        });
        break;
      case Failure(exception: final exception, stackTrace: final stackTrace):
        handleFailure(exception,
            stackTrace: stackTrace,
            onFailure: (exception) =>
                emit(const SearchJobStateError('Search error')));
    }
  }
}


