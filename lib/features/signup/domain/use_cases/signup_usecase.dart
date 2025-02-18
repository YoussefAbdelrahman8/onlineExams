import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/signup/domain/repositories/signup_repo.dart';

import '../entities/Signup_entity.dart';

@injectable
class SignupUseCase {
  SignupRepo repo;

  @factoryMethod
  SignupUseCase(this.repo);

  Future<Either<SignupEntity, String>>
  call({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber}) =>
      repo.createAccount(username: username,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phoneNumber: phoneNumber);
}