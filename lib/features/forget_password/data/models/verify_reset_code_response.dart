import 'package:online_exam_app/features/forget_password/domain/entities/verify_reset_code_entity.dart';

class VerifyResetCodeResponse {
  VerifyResetCodeResponse({
    this.message,
    this.code,
    this.status,
  });

  VerifyResetCodeResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
  }

  String? message;
  num? code;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['status'] = status;
    return map;
  }

  VerifyResetCodeEntity toVerifyResetCodeEntity() {
    return VerifyResetCodeEntity(message: message, status: status);
  }
}
