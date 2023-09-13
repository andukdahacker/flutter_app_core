import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../base/data/models/result.dart';
import '../../../../base/domain/base_use_case.dart';
import '../entity/login_data.dart';
import '../repository/auth_repository.dart';

typedef SaveAccessTokenOutput = Result<String, Exception>;

@injectable
class SaveAccessTokenUseCase implements UseCase<String, SaveAccessTokenOutput> {
  SaveAccessTokenUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  FutureOr<SaveAccessTokenOutput> execute(String input) async {
    return await _authRepository.saveAccessToken(input);
  }
}
