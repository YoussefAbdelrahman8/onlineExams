import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/verify_reset_code_entity.dart';

abstract class VerifyResetCodeRepo {
  Future<Either<VerifyResetCodeEntity, String>> verifyResetCode(
      {required String resetCode});
}
