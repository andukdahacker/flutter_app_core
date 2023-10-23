import 'package:equatable/equatable.dart';

import '../../../../domain/entity/job.dart';
import '../../../../domain/entity/tutor.dart';
import '../../../widget/search_bar_widget.dart';

sealed class HomeSearchState extends Equatable {
  const HomeSearchState();

  @override
  List<Object?> get props => [];
}

final class HomeSearchStateEmpty extends HomeSearchState {}

final class HomeSearchJobStateLoading extends HomeSearchState {
  final SearchType searchType;

  const HomeSearchJobStateLoading(this.searchType);

  @override
  List<Object?> get props => [searchType];
}



final class SearchJobStateSuccess extends HomeSearchState {
  const SearchJobStateSuccess(this.jobs);

  final List<Job> jobs;

  @override
  List<Object?> get props => [...super.props, jobs];
}

final class SearchTutorStateSuccess extends HomeSearchState {
  const SearchTutorStateSuccess(this.tutors);

  final List<Tutor> tutors;

  @override
  List<Object?> get props => [...super.props, tutors];
}

final class HomeSearchStateError extends HomeSearchState {
  const HomeSearchStateError(this.error);

  final String error;

  @override
  List<Object?> get props => [...super.props, error];
}
