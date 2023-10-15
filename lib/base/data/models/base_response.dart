import 'package:json_annotation/json_annotation.dart';

class BaseResponse<T> {
  @JsonKey(name: 'statusCode')
  int status;
  T data;
  String? message;

  BaseResponse({required this.status, required this.data, this.message});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) =>
      BaseResponse<T>(
        status: json['statusCode'] as int,
        data: fromJsonT(json['data']),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson(
    BaseResponse<T> instance,
    Map<String, dynamic>? Function(T value) toJsonT,
  ) =>
      <String, dynamic>{
        'statusCode': instance.status,
        'data': toJsonT(instance.data),
        'message': instance.message,
      };
}
