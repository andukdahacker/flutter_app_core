import 'package:json_annotation/json_annotation.dart';

part 'login_input.g.dart';

@JsonSerializable()
class LoginInput {
  LoginInput(this.username, this.password);

  String username;
  String password;

  Map<String, dynamic> toJson() => _$LoginInputToJson(this);
}
