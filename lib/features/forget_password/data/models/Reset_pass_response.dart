import 'package:online_exam_app/features/forget_password/domain/entities/reset_pass_entity.dart';

/// message : "success"
/// code : ""
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjNkODkwODZhMDI0ZjA2ZWEyN2MyZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5ODQxNTI1fQ.SrnbjaEwbZEf-1hUDGoBYT52d_vuZUE9xhVtsF6AFoI"

class ResetPasswordResponse {
  ResetPasswordResponse({
    this.message,
    this.code,
    this.token,
  });

  ResetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    token = json['token'];
  }

  String? message;
  String? code;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['token'] = token;
    return map;
  }

  ResetPasswordEntity toResetPasswordEntity() {
    return ResetPasswordEntity(message: message, token: token);
  }
}
