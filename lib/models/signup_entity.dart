import 'package:json_annotation/json_annotation.dart';
// part 'signup_entity.g.dart';

@JsonSerializable()
class SignUpResponse {
  @JsonKey(name:'code')
  int? code;
  @JsonKey(name:'status')
  String? status;
  @JsonKey(name:'message')
  String? message;
  @JsonKey(name:'data')
  Data? data;

  SignUpResponse({this.code, this.status, this.message, this.data});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;

  Data({this.token});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
