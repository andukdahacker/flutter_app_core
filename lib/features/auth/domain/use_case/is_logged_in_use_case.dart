import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../base/domain/base_use_case.dart';
import '../repository/auth_repository.dart';

part 'is_logged_in_use_case.freezed.dart';

@Injectable()
class IsLoggedInUseCase extends UseCase<IsLoggedInInput, IsLoggedInOutput> {
  IsLoggedInUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<IsLoggedInOutput> execute(IsLoggedInInput input) async {
    final isLoggedIn = await _repository.isLoggedIn();
    return IsLoggedInOutput(isLoggedIn: isLoggedIn);
  }
}

@freezed
class IsLoggedInInput with _$IsLoggedInInput {
  const factory IsLoggedInInput() = _IsLoggedInInput;
}

@freezed
class IsLoggedInOutput with _$IsLoggedInOutput {
  const IsLoggedInOutput._();

  const factory IsLoggedInOutput({
    @Default(false) bool isLoggedIn,
  }) = _IsLoggedInOutput;
}
