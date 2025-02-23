import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/login/domain/repositories/login_repo.dart';

import '../entities/Login_entity.dart';

@injectable
class LoginUseCase {
  LoginRepo repo;

  @factoryMethod
  LoginUseCase(this.repo);

  Future<Either<LoginEntity, String>> call(
          {required String email, required String password}) =>
      repo.login(email: email, password: password);
}
