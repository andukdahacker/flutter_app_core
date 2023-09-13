import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'statusCode') int status;
  T data;
  String? message;

  BaseResponse({required this.status, required this.data, this.message});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(
    BaseResponse<T> instance,
    Map<String, dynamic>? Function(T value) toJsonT,
  ) =>
      _$BaseResponseToJson(instance, (value) => toJsonT);
}
