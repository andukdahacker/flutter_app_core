import 'dart:async';

import 'package:dio/dio.dart';

import '../../modules/logger/app_logger.dart';
import '../data/models/base_response.dart';
import '../exceptions/internal_server_exception.dart';
import '../presentation/constant/status_code.dart';

FutureOr<void> handleResponse<T>(
  BaseResponse<T> response,
  Function(T successData)? onSuccess,
) {
  final StatusCode statusCode = StatusCode.of(response.status);

  switch (statusCode) {
    case StatusCode.success:
      onSuccess?.call(response.data);
    default:
      _handleApiStatusError(statusCode);
  }
}

FutureOr<void> _handleApiStatusError(StatusCode statusCode) {
  var errorMessagePresent = '';
  switch (statusCode) {
    case StatusCode.success:
      break;
    default:
      break;
  }
}

FutureOr<void> handleFailure<E extends Exception>(
  E exception, {
  StackTrace? stackTrace,
  Function(Exception exception)? onFailure,
}) {
  onFailure?.call(exception);

  switch (exception) {
    case FormatException():
      break;
    case InternalServerException(message: final message):
      logIt.e('Internal server exception with message: ${message}');
      break;
    case DioException(message: final message):
      logIt.e(message);
  }
}
