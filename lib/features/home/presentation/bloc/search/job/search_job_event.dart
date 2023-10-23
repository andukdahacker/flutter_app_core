
import 'package:equatable/equatable.dart';

import '../../../widget/search_bar_widget.dart';


sealed class HomeSearchEvent extends Equatable {
  const HomeSearchEvent();
}

final class SearchTextChanged extends HomeSearchEvent {
  const SearchTextChanged(this.text, this.searchType);

  final String text;
  final SearchType searchType;
  @override
  List<Object?> get props => [text, searchType];
}
