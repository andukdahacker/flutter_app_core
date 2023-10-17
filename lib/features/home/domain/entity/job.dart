import 'package:freezed_annotation/freezed_annotation.dart';

import 'job_type.dart';
import 'subject.dart';

part 'job.g.dart';

part 'job.freezed.dart';

@freezed
class Job with _$Job {
  const factory Job({
    required String id,
    required String learnerId,
    required String subjectId,
    @JsonKey(fromJson: Subject.fromJson) required Subject subject,
    required String title,
    String? fee,
    required String createdAt,
    required String jobType,
    required String jobMethod,
    required String jobStatus,
    String? description,
    int? numberOfSession,
    String? updatedAt,
  }) = _Job;

  const Job._();

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  JobType get type => JobType.of(jobType);
}
