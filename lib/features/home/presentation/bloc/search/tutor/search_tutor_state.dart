import 'package:equatable/equatable.dart';

import '../../../../domain/entity/tutor.dart';

sealed class SearchTutorState extends Equatable {
  const SearchTutorState();

  @override
  List<Object?> get props => [];
}

final class SearchTutorStateEmpty extends SearchTutorState {
  const SearchTutorStateEmpty();

  @override
  List<Object?> get props => [...super.props];
}

final class SearchTutorStateLoading extends SearchTutorState {
  const SearchTutorStateLoading();

  @override
  List<Object?> get props => [super.props];
}

final class SearchTutorStateSuccess extends SearchTutorState {
  const SearchTutorStateSuccess(this.tutors);

  final List<Tutor> tutors;

  @override
  List<Object?> get props => [...super.props, tutors];
}

final class SearchTutorStateError extends SearchTutorState {
  const SearchTutorStateError(this.error);

  final String error;

  @override
  List<Object?> get props => [...super.props, error];
}