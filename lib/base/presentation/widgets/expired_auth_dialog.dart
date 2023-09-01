import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme_src.dart';

class ExpiredAuthDialog extends StatelessWidget {
  const ExpiredAuthDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'notify'.tr(),
          style: const AppTextStyle(fontSize: 16, color: AppColor.black),
        ),
        const SizedBox(height: 8),
        Text(
          'expiredAuthDialogContent'.tr(),
          style: const AppTextStyle(),
        ),
      ],
    );
  }
}
