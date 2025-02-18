import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utiles/string_manager.dart';
import 'package:online_exam_app/features/forget_password/data/data_sources/forget_pass_dao.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_pass_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/repositories/forget_pass_repo.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl extends ForgetPasswordRepo {
  ForgetPasswordDao forgetPasswordDao;

  @factoryMethod
  ForgetPasswordRepoImpl(this.forgetPasswordDao);

  @override
  Future<Either<ForgetPassEntity, String>> forgetPassword(
      {required String email}) async {
    bool isConnected = true;
    if (isConnected) {
      var result = await forgetPasswordDao.forgetPassword(email: email);
      return result.fold((response) {
        return Left(response.toForgetPassEntity());
      }, (error) {
        return Right(error);
      });
    } else {
      return const Right(StringManager.noInternet);
    }

    throw UnimplementedError();
  }
}
