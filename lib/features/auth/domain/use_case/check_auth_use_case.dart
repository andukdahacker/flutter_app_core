import 'package:injectable/injectable.dart';

import '../../../../base/data/models/result.dart';
import '../../../../base/domain/base_use_case.dart';
import '../repository/auth_repository.dart';

typedef CheckAuthOutput = Result<String, Exception>;

@injectable
class CheckAuthUseCase implements NoInputUseCase<CheckAuthOutput> {
  CheckAuthUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  CheckAuthOutput execute() {
    return _authRepository.checkAuth();
  }
}
