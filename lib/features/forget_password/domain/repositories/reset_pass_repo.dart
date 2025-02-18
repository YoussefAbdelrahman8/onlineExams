import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/reset_pass_entity.dart';

abstract class ResetPasswordRepo {
  Future<Either<ResetPasswordEntity, String>> resetPassword(
      {required String email, required String newPassword});
}
