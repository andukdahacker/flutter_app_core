



import 'package:equatable/equatable.dart';

import '../../../domain/entity/job.dart';

sealed class HomeSearchState extends Equatable {
  const HomeSearchState();

  @override
  List<Object?> get props => [];
}

final class HomeSearchStateEmpty extends HomeSearchState {}

final class HomeSearchStateLoading extends HomeSearchState {}

final class SearchJobStateSuccess extends HomeSearchState {
  const SearchJobStateSuccess(this.jobs);
  final List<Job> jobs;

  @override
  List<Object?> get props => [...super.props, jobs];
}

final class HomeSearchStateError extends HomeSearchState {
  const HomeSearchStateError(this.error);
  final String error;

  @override
  List<Object?> get props => [...super.props, error];
}
