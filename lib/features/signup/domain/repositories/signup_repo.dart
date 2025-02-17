import 'package:dartz/dartz.dart';

import '../entities/Signup_entity.dart';

abstract class SignupRepo{
  Future<Either<SignupEntity, String>> createAccount({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
  });

}