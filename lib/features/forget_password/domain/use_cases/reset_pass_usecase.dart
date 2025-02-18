import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/domain/repositories/reset_pass_repo.dart';

import '../entities/reset_pass_entity.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordRepo repo;

  @factoryMethod
  ResetPasswordUseCase(this.repo);

  Future<Either<ResetPasswordEntity, String>> call(
          {required String email, required String newPassword}) =>
      repo.resetPassword(email: email, newPassword: newPassword);
}
