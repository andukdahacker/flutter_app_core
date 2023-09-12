import 'dart:async';

import '../../../../base/domain/base_use_case.dart';
import '../entity/login_data.dart';

class SaveUserDataUseCase implements UseCase<LoginData, bool> {
  @override
  FutureOr<bool> execute(LoginData input) {
    return false;
  }
}
