import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/forget_password/data/models/Forget_pass_response.dart';

abstract class ForgetPasswordDao {
  Future<Either<ForgetPasswordResponse, String>> forgetPassword({
    required String email,
  });
}
