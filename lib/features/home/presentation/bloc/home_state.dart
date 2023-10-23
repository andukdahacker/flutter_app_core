import 'package:freezed_annotation/freezed_annotation.dart';

import '../widget/search_bar_widget.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({@Default(SearchType.job) SearchType searchType}) = _HomeState;
}
