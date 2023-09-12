import 'package:json_annotation/json_annotation.dart';

part 'login_input.g.dart';

@JsonSerializable()
class LoginInput {
  LoginInput(this.email, this.password);

  String email;
  String password;

  Map<String, dynamic> toJson() => _$LoginInputToJson(this);
}
