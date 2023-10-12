import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.g.dart';

part 'subject.freezed.dart';

@freezed
class Subject with _$Subject {
  const factory Subject({
    required String id,
    required String name,
    String? description,
  }) = _Subject;

  factory Subject.fromJson(Map<String, Object?> json) => _$SubjectFromJson(json);
}
