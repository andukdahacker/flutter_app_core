import 'package:equatable/equatable.dart';

sealed class SearchTutorEvent extends Equatable {
  const SearchTutorEvent();

  @override
  List<Object?> get props => [];
}

final class SearchTutorTextChanged extends SearchTutorEvent {
  const SearchTutorTextChanged(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}