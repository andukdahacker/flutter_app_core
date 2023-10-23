import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../widget/search_bar_widget.dart';
import 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  
  void changeSearchType(SearchType searchType) {
    emit(state.copyWith(searchType: searchType));
  }
}
