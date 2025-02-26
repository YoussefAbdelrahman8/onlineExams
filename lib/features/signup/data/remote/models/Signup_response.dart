import 'package:online_exam_app/features/signup/domain/entities/Signup_entity.dart';

import 'User.dart';

/// code : 409
/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjBiNmI1ODZhMDI0ZjA2ZWEyNmRmZCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5NjM0MzU3fQ.KQf9GtmDuIKzUAC7-S_XkZRHvXTW8EgiXSCb6o3SEL0"
/// user : {"username":"Ashraf","firstName":"Elevatee","lastName":"Tech","email":"youssef@1elevate.com","phone":"01094155711","role":"user","isVerified":false,"_id":"67b0b6b586a024f06ea26dfd","createdAt":"2025-02-15T15:45:57.213Z"}

class SignupResponse {
  SignupResponse({
    this.code,
    this.message,
    this.token,
    this.user,
  });

  SignupResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  num? code;
  String? message;
  String? token;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

  SignupEntity toSignupEntity() {
    return SignupEntity(message: message, token: token, user: user);
  }
}
