import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../base/domain/navigation/app_navigation.dart';
import '../../../base/domain/navigation/app_popup_info.dart';
import '../../../base/presentation/theme/app_theme_src.dart';
import '../../../base/presentation/widgets/dialog/contents/alert_dialog_content.dart';
import '../../../base/presentation/widgets/dialog/contents/two_button_dialog_content.dart';
import '../base/base_popup_info_mapper.dart';

@injectable
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(AppPopupInfo appPopupInfo, AppNavigator navigator) {
    return appPopupInfo.when(
      showAlertDialog: (
        String title,
        String message,
        String buttonTitle,
        VoidCallback? onPressed,
      ) {
        return AlertDialog(
          contentPadding: AppEdgeInsets.zero,
          content: AlertDialogContent(
            buttonTitle: buttonTitle,
            onPressed: onPressed ?? navigator.pop,
            child: Column(
              children: [
                Text(
                  title,
                  style: const AppTextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: const AppTextStyle(),
                ),
              ],
            ),
          ),
        );
      },
      showTwoButtonDialog: (
        String title,
        String message,
        String titleLeft,
        String titleRight,
        VoidCallback? onTapFirst,
        VoidCallback? onTapSecond,
      ) {
        return AlertDialog(
          contentPadding: AppEdgeInsets.zero,
          content: TwoButtonDialogContent(
            titleLeft: titleLeft,
            titleRight: titleRight,
            onClickLeft: onTapFirst,
            onClickRight: onTapSecond,
            child: Column(
              children: [
                Text(
                  title,
                  style: const AppTextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: const AppTextStyle(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
