import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_pass_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/repositories/forget_pass_repo.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepo repo;

  @factoryMethod
  ForgetPasswordUseCase(this.repo);

  Future<Either<ForgetPassEntity, String>> call({required String email}) =>
      repo.forgetPassword(email: email);
}
