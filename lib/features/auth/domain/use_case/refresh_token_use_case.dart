import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../base/data/models/base_response.dart';
import '../../../../base/data/models/result.dart';
import '../../../../base/domain/base_use_case.dart';
import '../repository/auth_repository.dart';

typedef RefreshTokenOutput = Result<BaseResponse<String>, Exception>;

@injectable
class RefreshTokenUseCase extends NoInputUseCase<RefreshTokenOutput> {
  RefreshTokenUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<RefreshTokenOutput> execute() async {
    return await _authRepository.refreshToken();
  }
}
