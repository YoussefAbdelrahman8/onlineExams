import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/forget_password/data/models/Reset_pass_response.dart';

abstract class ResetPasswordDao {
  Future<Either<ResetPasswordResponse, String>> resetPassword(
      {required String email, required String newPassword});
}
