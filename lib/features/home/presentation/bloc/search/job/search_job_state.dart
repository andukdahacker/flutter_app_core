import 'package:equatable/equatable.dart';

import '../../../../domain/entity/job.dart';
import '../../../../domain/entity/tutor.dart';
import '../../../widget/search_bar_widget.dart';

sealed class SearchJobState extends Equatable {
  const SearchJobState();

  @override
  List<Object?> get props => [];
}

final class SearchJobStateEmpty extends SearchJobState {}

final class SearchJobStateLoading extends SearchJobState {

  const SearchJobStateLoading();

  @override
  List<Object?> get props => [];
}

final class SearchJobStateSuccess extends SearchJobState {
  const SearchJobStateSuccess(this.jobs);

  final List<Job> jobs;

  @override
  List<Object?> get props => [...super.props, jobs];
}

final class SearchJobStateError extends SearchJobState {
  const SearchJobStateError(this.error);

  final String error;

  @override
  List<Object?> get props => [...super.props, error];
}
