import 'package:injectable/injectable.dart';

import '../../../../base/domain/base_use_case.dart';
import '../../../../base/utils/validation_utils.dart';

@injectable
class ValidatePasswordUseCase implements UseCase<String, String?> {
  @override
  String? execute(String password) {
    return ValidationUtils.validatePassword(password);
  }
}