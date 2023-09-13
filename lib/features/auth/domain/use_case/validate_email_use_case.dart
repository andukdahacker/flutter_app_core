import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../base/domain/base_use_case.dart';
import '../../../../base/utils/validation_utils.dart';

@injectable
class ValidateEmailUseCase implements UseCase<String, String?> {
  @override
  String? execute(String email) {
    return ValidationUtils.validateEmail(email);
  }
}