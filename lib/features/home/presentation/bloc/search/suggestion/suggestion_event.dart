import 'package:equatable/equatable.dart';

sealed class SuggestionEvent extends Equatable {
  const SuggestionEvent();

  @override
  List<Object?> get props => [];
}

final class SuggestionTextChanged extends SuggestionEvent {
  const SuggestionTextChanged(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}