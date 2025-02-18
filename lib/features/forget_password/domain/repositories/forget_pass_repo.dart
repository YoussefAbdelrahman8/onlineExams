import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_pass_entity.dart';

abstract class ForgetPasswordRepo {
  Future<Either<ForgetPassEntity, String>> forgetPassword(
      {required String email});
}
