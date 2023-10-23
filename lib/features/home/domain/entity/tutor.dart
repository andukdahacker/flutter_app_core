import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entity/user.dart';

part 'tutor.g.dart';

@JsonSerializable()
class Tutor {
  Tutor({required this.id, required this.user, required this.bio});
  final String id;
  final String bio;
  final User user;

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);

  Map<String, dynamic> toJson() => _$TutorToJson(this);
}