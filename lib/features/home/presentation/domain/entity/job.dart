import 'package:freezed_annotation/freezed_annotation.dart';

import 'job_type.dart';

part 'job.g.dart';

part 'job.freezed.dart';

@freezed
class Job with _$Job {
  const factory Job({
    required String id,
    required String learnerId,
    required String subjectId,
    required String title,
    required num fee,
    required int createdAt,
    required String jobType,
    required String jobMethod,
    required String jobStatus,
    String? description,
    int? numberOfSession,
    int? updatedAt,
  }) = _Job;

  factory Job.fromJson(Map<String, Object?> json) => _$JobFromJson(json);

  JobType get type => JobType.of(jobType);
}
