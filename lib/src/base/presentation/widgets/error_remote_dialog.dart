import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/asset_paths/icons_paths.dart';
import '../theme/app_theme_src.dart';

class ErrorRemoteDialog extends StatelessWidget {
  const ErrorRemoteDialog({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(IconPaths.icError),
        const SizedBox(height: 8),
        Text(
          'error'.tr(),
          style: const AppTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          errorMessage,
          style: const AppTextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
