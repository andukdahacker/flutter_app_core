import 'package:flutter/material.dart';

import '../../../../base/presentation/extension/context_theme.dart';
import '../../../../base/presentation/theme/app_color.dart';
import '../../../../base/presentation/widget/spacing_widgets.dart';
import '../../domain/entity/tutor.dart';

class TutorCardWidget extends StatelessWidget {
  const TutorCardWidget({required this.tutor, super.key});

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.primary),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(''),
                    child: Text(
                      'Image',
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                ),
                width16,
                Column(
                  children: [
                    Text(
                      tutor.user.username,
                      style: context.textTheme.labelLarge,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('100.000 VND', style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),),
                    Text('Hourly rate', style: context.textTheme.labelMedium,)
                  ],
                ),
                Column(
                  children: [
                    Text('100', style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),),
                    Text('Student tutored', style: context.textTheme.labelMedium,)
                  ],
                ),
              ],
            ),
            Text(tutor.bio, style: context.textTheme.bodyMedium,),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(onPressed: () {}, child: const Text('View Profile')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
