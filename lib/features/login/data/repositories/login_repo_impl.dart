import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utiles/string_manager.dart';
import 'package:online_exam_app/features/login/data/remote/data_sources/login_dao.dart';
import 'package:online_exam_app/features/login/domain/entities/Login_entity.dart';
import 'package:online_exam_app/features/login/domain/repositories/login_repo.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl extends LoginRepo {
  LogInDao logInDao;

  @factoryMethod
  LoginRepoImpl(this.logInDao);

  @override
  Future<Either<LoginEntity, String>> login(
      {required String email, required String password}) async {
    bool isConnected = true;
    if (isConnected) {
      var result = await logInDao.login(email: email, password: password);
      return result.fold((response) {
        return Left(response.toLoginEntity());
      }, (error) {
        return Right(error);
      });
    } else {
      return const Right(StringManager.noInternet);
    }
    throw UnimplementedError();
  }
}
