
import 'package:equatable/equatable.dart';

import '../../../widget/search_bar_widget.dart';


sealed class SearchJobEvent extends Equatable {
  const SearchJobEvent();
}

final class SearchJobTextChanged extends SearchJobEvent {
  const SearchJobTextChanged(this.text);

  final String text;
  @override
  List<Object?> get props => [text];
}
