import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_cubit.dart';
import '../../../di/di.dart';
import '../../data/models/base_response.dart';
import '../../data/models/result.dart';
import '../../domain/navigation/app_navigation.dart';
import '../../domain/navigation/app_popup_info.dart';
import '../../exceptions/internal_server_exception.dart';
import '../common_cubit/common_cubit.dart';
import '../constant/status_code.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  final AppNavigator navigation = getIt.get<AppNavigator>();
  final AppCubit appCubit = getIt.get<AppCubit>();
  final CommonCubit commonCubit = getIt.get<CommonCubit>();

  Future<void> consumeState<T extends BaseResponse, E extends Exception>(
    Future<Result<T, E>> Function() function, {
    Function(T)? onSuccess,
    Function(Exception)? onFailure,
  }) async {
    commonCubit.showLoading();
    final result = await function.call();
    switch (result) {
      case Success<T, E>():
        _handleResponse(
          result.value,
          (successData) => onSuccess?.call(result.value),
        );
      case Failure<T, E>():
        _handleFailure(
          result.exception,
          stackTrace: result.stackTrace,
          onFailure: (exception) => onFailure?.call(exception),
        );
    }
    commonCubit.hideLoading();
  }

  FutureOr<void> _handleResponse<T>(
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
        errorMessagePresent = 'unknown'.tr();
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

    Future.delayed(
      const Duration(seconds: 0),
      () => navigation.showDialog(
        AppPopupInfo.showAlertDialog(
          title: 'error'.tr(),
          buttonTitle: 'ok'.tr(),
          message: errorMessagePresent,
        ),
      ),
    );
  }

  FutureOr<void> _handleFailure<E extends Exception>(
    E exception, {
    StackTrace? stackTrace,
    Function(Exception exception)? onFailure,
  }) {
    onFailure?.call(exception);
    switch (exception) {
      case FormatException():
      case InternalServerException():
      case DioException():
        final error = exception as DioException;
        navigation.showDialog(
          AppPopupInfo.showAlertDialog(
            title: 'error'.tr(),
            buttonTitle: 'ok'.tr(),
            message: error.message ?? '',
          ),
        );
        break;
    }
  }
}
