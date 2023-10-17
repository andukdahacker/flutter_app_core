import 'package:flutter/material.dart';

import '../../../../base/presentation/theme/app_theme_src.dart';
import '../../domain/entity/job.dart';

class JobCardWidget extends StatelessWidget {
  const JobCardWidget({required this.job, super.key});
  final Job job;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor.primary),
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        children: [
          Text('${job.title}'),
          Text('${job.updatedAt}'),
          Row(
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
              OutlinedButton(onPressed: () {}, child: Text('See more')),
              ElevatedButton(onPressed: () {}, child: Text('Apply')),
            ],
          )
        ],
      ),
    );
  }
}
