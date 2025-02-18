import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utiles/string_manager.dart';
import 'package:online_exam_app/features/forget_password/data/data_sources/reset_pass_dao.dart';

import 'package:online_exam_app/features/forget_password/domain/entities/reset_pass_entity.dart';

import '../../domain/repositories/reset_pass_repo.dart';

@Injectable(as: ResetPasswordRepo)
class ResetPasswordRepoImpl extends ResetPasswordRepo {
  ResetPasswordDao resetPasswordDao;

  @factoryMethod
  ResetPasswordRepoImpl(this.resetPasswordDao);

  @override
  Future<Either<ResetPasswordEntity, String>> resetPassword(
      {required String email, required String newPassword}) async {
    bool isConnected = true;
    if (isConnected) {
      var result = await resetPasswordDao.resetPassword(
          email: email, newPassword: newPassword);
      return result.fold((response) {
        return Left(response.toResetPasswordEntity());
      }, (error) {
        return Right(error);
      });
    } else {
      return Right(StringManager.noInternet);
    }
    throw UnimplementedError();
  }
}
