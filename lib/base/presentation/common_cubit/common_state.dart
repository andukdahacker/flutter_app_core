import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState with _$CommonState {
  const factory CommonState({
    @Default(false) bool isLoading,
  }) = _CommonState;
}
