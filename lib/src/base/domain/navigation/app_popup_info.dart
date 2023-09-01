import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_popup_info.freezed.dart';

/// dialog, bottomsheet
@freezed
class AppPopupInfo with _$AppPopupInfo {
  const factory AppPopupInfo.showAlertDialog({
    @Default('') String title,
    @Default('') String message,
    @Default('') String buttonTitle,
    VoidCallback? onPressed,
  }) = _ConfirmDialog;

  const factory AppPopupInfo.showTwoButtonDialog({
    @Default('') String title,
    @Default('') String titleLeft,
    @Default('') String titleRight,
    @Default('') String message,
    VoidCallback? onTapFirst,
    VoidCallback? onTapSecond,
  }) = _TwoButtonDialog;
}
