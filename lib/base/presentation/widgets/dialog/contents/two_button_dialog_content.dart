import 'package:flutter/material.dart';
import '../../../theme/app_theme_src.dart';

class TwoButtonDialogContent extends StatelessWidget {
  const TwoButtonDialogContent({
    required this.child, required this.titleLeft, required this.titleRight, required this.onClickLeft, required this.onClickRight, super.key,
  });
  final Widget child;
  final String titleLeft;
  final String titleRight;
  final Function()? onClickLeft;
  final Function()? onClickRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 25, 8, 11),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: AppBorderRadius.circular16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          const Divider(),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onClickLeft,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        borderRadius: AppBorderRadius.circular6,
                      ),
                      child: Text(
                        titleLeft,
                        textAlign: TextAlign.center,
                        style: const AppTextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30, child: VerticalDivider()),
                Expanded(
                  child: GestureDetector(
                    onTap: onClickRight,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        borderRadius: AppBorderRadius.circular6,
                      ),
                      child: Text(
                        titleRight,
                        textAlign: TextAlign.center,
                        style: const AppTextStyle(
                          color: AppColor.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
