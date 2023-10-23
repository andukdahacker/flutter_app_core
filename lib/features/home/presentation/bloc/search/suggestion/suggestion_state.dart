import 'package:equatable/equatable.dart';

import '../../../../domain/entity/subject.dart';

sealed class SuggestionState extends Equatable {
  const SuggestionState();

  @override
  List<Object?> get props => [];
}

final class SuggestionStateEmpty extends SuggestionState {
  const SuggestionStateEmpty();

  @override
  List<Object?> get props => super.props;
}

final class SuggestionStateLoading extends SuggestionState {
  const SuggestionStateLoading();

  @override
  List<Object?> get props => super.props;
}

final class SuggestionStateSuccess extends SuggestionState {
  const SuggestionStateSuccess(this.subjects);

  final List<Subject> subjects;

  @override
  List<Object?> get props => [...super.props, subjects];
}

final class SuggestionStateError extends SuggestionState {
  const SuggestionStateError(this.error);

  final String error;

  @override
  List<Object?> get props => [...super.props, error];
}