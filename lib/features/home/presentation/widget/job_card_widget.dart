import 'package:flutter/material.dart';

import '../../../../base/presentation/extension/context_theme.dart';
import '../../../../base/presentation/theme/app_theme_src.dart';
import '../../../../base/presentation/widget/spacing_widgets.dart';
import '../../domain/entity/job.dart';

class JobCardWidget extends StatelessWidget {
  const JobCardWidget({required this.job, super.key});
  final Job job;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor.primary),
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${job.title}', style: context.textTheme.titleMedium,),
            Text('${job.updatedAt}', style: context.textTheme.bodyMedium,),
            height16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('${job.fee} VND'),
                    const Text('Hourly')
                  ],
                ),
                Column(
                  children: [
                    Text('${job.jobMethod}'),
                    const Text('Location')
                  ],
                ),
              ],
            ),
            Text(job.description ?? ''),
            Chip(label: Text('${job.subject.name}')),
            Row(
              children: [
                Spacer(),
                OutlinedButton(onPressed: () {}, child: Text('See more')),
                width16,
                ElevatedButton(onPressed: () {}, child: Text('Apply')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
