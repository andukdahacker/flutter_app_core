import 'package:injectable/injectable.dart';
import '../bloc/base_cubit.dart';
import 'common_state.dart';

@injectable
class CommonCubit extends BaseCubit<CommonState> {
  CommonCubit() : super(const CommonState());

  void showLoading() {
    emit(state.copyWith(isLoading: true));
  }

  void hideLoading() {
    emit(state.copyWith(isLoading: false));
  }
}
