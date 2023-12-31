import 'package:injectable/injectable.dart';

import '../../../../base/data/models/base_response.dart';
import '../../../../base/data/models/result.dart';
import '../../../../base/domain/base_use_case.dart';
import '../../data/data_source/models/login_model.dart';
import '../entity/login_input.dart';
import '../repository/auth_repository.dart';

typedef LoginOutput = Result<BaseResponse<LoginModel>, Exception>;

@injectable
class LoginUseCase extends UseCase<LoginInput, LoginOutput> {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<LoginOutput> execute(LoginInput input) async {
    final res = await _repository.login(input);
    return res;
  }
}
