import 'package:online_exam_app/features/forget_password/domain/entities/forget_pass_entity.dart';

/// message : "There is no account with this email address  youssef.abdelrahman158@gmail.com"
/// code : 404
/// info : "OTP sent to your email"

class ForgetPasswordResponse {
  ForgetPasswordResponse({
    this.message,
    this.code,
    this.info,
  });

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    info = json['info'];
  }

  String? message;
  num? code;
  String? info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['info'] = info;
    return map;
  }

  ForgetPassEntity toForgetPassEntity() {
    return ForgetPassEntity(message: message, info: info);
  }
}
