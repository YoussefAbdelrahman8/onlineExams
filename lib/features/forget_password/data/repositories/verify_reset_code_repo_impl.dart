import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utiles/string_manager.dart';
import 'package:online_exam_app/features/forget_password/data/data_sources/verify_reset_code_dao.dart';

import 'package:online_exam_app/features/forget_password/domain/entities/verify_reset_code_entity.dart';

import '../../domain/repositories/verify_reset_code_repo.dart';

@Injectable(as: VerifyResetCodeRepo)
class VerifyResetCodeRepoImpl extends VerifyResetCodeRepo {
  VerifyResetCodeDao verifyDao;

  @factoryMethod
  VerifyResetCodeRepoImpl(this.verifyDao);

  @override
  Future<Either<VerifyResetCodeEntity, String>> verifyResetCode(
      {required String resetCode}) async {
    bool isConnected = true;
    if (isConnected) {
      var result = await verifyDao.verifyResetCode(resetCode: resetCode);
      result.fold((response) {
        return Left(response.toVerifyResetCodeEntity());
      }, (error) {
        return Right(error);
      });
    } else {
      return Right(StringManager.noInternet);
    }
    throw UnimplementedError();
  }
}
