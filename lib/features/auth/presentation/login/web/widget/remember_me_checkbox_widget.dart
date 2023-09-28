import 'package:flutter/material.dart';

import '../../../../../../base/presentation/extension/extension.dart';
import '../../../../../../base/presentation/widget/spacing_widgets.dart';

class RememberMeCheckboxWidget extends StatefulWidget {
  const RememberMeCheckboxWidget(
      {required this.rememberMeValue, this.onChanged, super.key});

  final bool rememberMeValue;
  final void Function(bool)? onChanged;

  @override
  State<RememberMeCheckboxWidget> createState() =>
      _RememberMeCheckboxWidgetState();
}

class _RememberMeCheckboxWidgetState extends State<RememberMeCheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: widget.rememberMeValue,
            onChanged: (value) {
              if (widget.onChanged != null && value != null) {
                widget.onChanged?.call(value);
              }
            }),
        width4,
        Text(
          'Remember me',
          style: context.textTheme.labelSmall,
        ),
      ],
    );
  }
}
