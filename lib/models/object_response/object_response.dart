import 'package:json_annotation/json_annotation.dart';

part 'object_response.g.dart';


@JsonSerializable(genericArgumentFactories: true)
class ObjectResponse<T> {
  @JsonKey(name:"code")
  final int code;
  @JsonKey(name:"status")
  final String status;
  @JsonKey(name:"message",defaultValue: "")
  final String message;
  @JsonKey(name:"data")
  final T? data;

  ObjectResponse({
    this.message = "",
    this.data,
    this.code = 0,
    this.status = ""
  });

  factory ObjectResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ObjectResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ObjectResponseToJson(this, toJsonT);
}
