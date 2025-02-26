import 'package:online_exam_app/features/login/domain/entities/Login_entity.dart';

import 'User.dart';

/// code : ""
/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjNkODkwODZhMDI0ZjA2ZWEyN2MyZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQwMzM4OTkyfQ.k8AzlOsjhaoE_Mi9MvwlngULcesqbBWNXxokaiXypNs"
/// user : {"_id":"67b3d89086a024f06ea27c2f","username":"ashaff","firstName":"youssef","lastName":"ashra","email":"youssef.abdelrahman158@gmail.com","phone":"01094155711","role":"user","isVerified":false,"createdAt":"2025-02-18T00:47:12.820Z","passwordChangedAt":"2025-02-23T19:29:15.660Z"}

class SigninResponse {
  SigninResponse({
    this.code,
    this.message,
    this.token,
    this.user,
  });

  SigninResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String? code;
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

  LoginEntity toLoginEntity() {
    return LoginEntity(
      message: message,
      token: token,
      code: code,
      user: user,
    );
  }
}
