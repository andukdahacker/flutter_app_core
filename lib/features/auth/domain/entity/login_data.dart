import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'login_data.freezed.dart';

part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(fromJson: User.fromJson) User? user,
    @JsonKey(name: 'access_token') String? accessToken,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
