
import 'package:equatable/equatable.dart';

sealed class HomeSearchEvent extends Equatable {
  const HomeSearchEvent();
}

final class SearchTextChanged extends HomeSearchEvent {
  const SearchTextChanged(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}
