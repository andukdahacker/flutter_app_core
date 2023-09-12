import 'package:flutter/material.dart';

import '../../../../../../base/presentation/extension/extension.dart';
import '../../../../../../base/presentation/widget/spacing_widgets.dart';

class RememberMeCheckboxWidget extends StatefulWidget {
  const RememberMeCheckboxWidget({super.key});

  @override
  State<RememberMeCheckboxWidget> createState() =>
      _RememberMeCheckboxWidgetState();
}

class _RememberMeCheckboxWidgetState extends State<RememberMeCheckboxWidget> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: value,
            onChanged: (newValue) {
              if (newValue != null) {
                setState(() {
                  value = newValue;
                });
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
