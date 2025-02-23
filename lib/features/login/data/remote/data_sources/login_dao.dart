import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/login/data/remote/models/Signin_response.dart';

abstract class LogInDao {
  Future<Either<SigninResponse, String>> login(
      {required String email, required String password});
}
