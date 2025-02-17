import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/signup/data/remote/models/Signup_response.dart';

abstract class SignupDao {
  Future<Either<SignupResponse, String>> createAccount({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
  });
}
