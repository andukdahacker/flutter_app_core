import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../modules/db/db.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String email,
    required bool isVerified,
    String? avatar,
    int? createdAt,
    int? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.fromDb(UserTableData userTableData) => User(
        id: userTableData.id,
        username: userTableData.username,
        email: userTableData.email,
        isVerified: userTableData.isVerified,
        avatar: userTableData.avatar,
      );
}
