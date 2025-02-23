import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/domain/repositories/verify_reset_code_repo.dart';

import '../entities/verify_reset_code_entity.dart';

@injectable
class VerifyResetCodeUseCase {
  VerifyResetCodeRepo repo;

  @factoryMethod
  VerifyResetCodeUseCase(this.repo);

  Future<Either<VerifyResetCodeEntity, String>> call(
          {required String resetCode}) => repo.verifyResetCode(resetCode: resetCode);
}
