import 'package:json_annotation/json_annotation.dart';

part 'login_input.g.dart';

@JsonSerializable()
class LoginInput {
  LoginInput(this.email, this.password, this.rememberMe);

  String email;
  String password;
  bool rememberMe;

  Map<String, dynamic> toJson() => _$LoginInputToJson(this);
}
