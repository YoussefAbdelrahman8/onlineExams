import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/signup/data/remote/data_sources/signup_dao.dart';
import 'package:online_exam_app/features/signup/data/remote/models/Signup_response.dart';
import 'package:online_exam_app/features/signup/domain/repositories/signup_repo.dart';

import '../../../../core/network/internet_checker.dart';
import '../../../../core/utiles/string_manager.dart';
import '../../domain/entities/Signup_entity.dart';

@Injectable(as: SignupRepo)
class SignupRepoImpl extends SignupRepo {
  SignupDao signupDao;

  @factoryMethod
  SignupRepoImpl(this.signupDao);

  @override
  Future<Either<SignupEntity, String>> createAccount(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber}) async {
    bool isConnected = true;
    if (isConnected) {
      var result = await signupDao.createAccount(
          username: username,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phoneNumber: phoneNumber);
      return result.fold((response) {
        return Left(response.toSignupEntity());
      }, (error) {
        return Right(error);
      });
    } else {
      return const Right(StringManager.noInternet);
    }

    throw UnimplementedError();
  }
}
