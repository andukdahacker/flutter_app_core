import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../base/data/models/result.dart';
import '../../../../base/domain/base_use_case.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';

typedef SaveUserOutput = Result<User, Exception>;

@injectable
class SaveUserUseCase extends UseCase<User, SaveUserOutput> {
  SaveUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  FutureOr<SaveUserOutput> execute(User input) async {
    return await _authRepository.saveUser(input);
  }
}
