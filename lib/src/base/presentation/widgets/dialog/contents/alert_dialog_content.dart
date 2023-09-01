import 'package:flutter/material.dart';
import '../../../theme/app_theme_src.dart';

class AlertDialogContent extends StatelessWidget {
  const AlertDialogContent({
    required this.child, required this.buttonTitle, super.key,
    this.onPressed,
  });
  final Widget child;
  final String buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(23, 14, 23, 20),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: AppBorderRadius.circular16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          const SizedBox(height: 16),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: double.infinity,
              padding: AppEdgeInsets.all12,
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.circular8,
                border: Border.all(color: AppColor.black),
              ),
              child: Text(
                buttonTitle,
                textAlign: TextAlign.center,
                style: const AppTextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
