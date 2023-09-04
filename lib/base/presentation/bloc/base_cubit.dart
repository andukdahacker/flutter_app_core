import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/base_response.dart';
import '../../exceptions/internal_server_exception.dart';
import '../constant/status_code.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  FutureOr<void> handleResponse<T>(
    BaseResponse<T> response,
    Function(T? successData)? onSuccess,
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
      case StatusCode.unknown:
        errorMessagePresent = '';
        break;
      case StatusCode.success:
      case StatusCode.errorEncryptedData:
      case StatusCode.zero:
      case StatusCode.missingData:
      case StatusCode.notPermission:
      case StatusCode.notSuccess:
      case StatusCode.operationFailed:
      case StatusCode.notEmployeeSchool:
      case StatusCode.notUseAttendance:
      case StatusCode.errorFaceRecognition:
      case StatusCode.notFaceRecognition:
      case StatusCode.notFoundFace:
      case StatusCode.notRegisterFace:
      case StatusCode.notFoundStudent:
      case StatusCode.notFoundUser:
      case StatusCode.tokenExpired:
      case StatusCode.invalidToken:
      case StatusCode.errorToken:
      case StatusCode.notFoundToken:
      case StatusCode.userLocked:
      case StatusCode.userNotPermissionAttendance:
      case StatusCode.invalidPassword:
      case StatusCode.userNotExist:
      case StatusCode.userNotField:
      case StatusCode.notFoundAccount:
      case StatusCode.notAuthenticator:
      case StatusCode.notFindStudent:
      case StatusCode.notFindStudentInList:
      case StatusCode.notFound:
      case StatusCode.existedFace:
      case StatusCode.errorAsyncAws:
      case StatusCode.errorRegisterFaceRecognition:
      case StatusCode.errorDate:
      case StatusCode.errorStudentNotAttendance:
      case StatusCode.errorStudentAddParent:
      case StatusCode.notParentOfStudent:
      case StatusCode.notFoundParent:
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
      case InternalServerException():
      case DioException():
    }
  }
}
