import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../base/data/models/base_response.dart';
import '../../../../../../base/data/models/paginated.dart';
import '../../../../../../base/data/models/result.dart';
import '../../../../../../base/presentation/bloc/bloc_utils.dart';
import '../../../../../../base/utils/api_utils.dart';
import '../../../../domain/entity/search_subject_input.dart';
import '../../../../domain/entity/subject.dart';
import '../../../../domain/usecases/search_subject_use_case.dart';
import 'suggestion_event.dart';
import 'suggestion_state.dart';

@lazySingleton
class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionBloc(this._searchSubjectUseCase)
      : super(const SuggestionStateEmpty()) {
    on<SuggestionTextChanged>(_onSuggestionTextChanged,
        transformer: BlocUtils.debounce(const Duration(milliseconds: 500)));
  }

  final SearchSubjectUseCase _searchSubjectUseCase;

  FutureOr<void> _onSuggestionTextChanged(
      SuggestionTextChanged event, Emitter<SuggestionState> emit) async {
    emit(const SuggestionStateLoading());

    final result = await _searchSubjectUseCase
        .execute(SearchSubjectInput(searchString: event.text, take: 10));

    switch (result) {
      case Success<BaseResponse<Paginated<Subject>>, Exception>(
          value: final value
        ):
        handleResponse(value, (successData) {
          if (successData.nodes.isEmpty) {
            emit(const SuggestionStateEmpty());
          } else {
            emit(SuggestionStateSuccess(successData.nodes));
          }
        });
      case Failure<BaseResponse<Paginated<Subject>>, Exception>(
          exception: final exception,
          stackTrace: final stackTrace
        ):
        handleFailure(exception,
            stackTrace: stackTrace,
            onFailure: (exception) =>
                emit(const SuggestionStateError('Search subject error')));
    }
  }
}
