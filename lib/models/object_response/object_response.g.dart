// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectResponse<T> _$ObjectResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ObjectResponse<T>(
      message: json['message'] as String? ?? '',
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      code: json['code'] as int? ?? 0,
      status: json['status'] as String? ?? "",
    );

Map<String, dynamic> _$ObjectResponseToJson<T>(
  ObjectResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
