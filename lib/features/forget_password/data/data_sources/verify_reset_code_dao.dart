import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/forget_password/data/models/verify_reset_code_response.dart';

abstract class VerifyResetCodeDao{

  Future<Either<VerifyResetCodeResponse,String>> verifyResetCode({required String resetCode});

}