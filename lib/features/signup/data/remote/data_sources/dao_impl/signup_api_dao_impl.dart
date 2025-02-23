import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/network/api_manager.dart';
import 'package:online_exam_app/core/network/endpoints.dart';
import 'package:online_exam_app/features/signup/data/remote/data_sources/signup_dao.dart';
import 'package:online_exam_app/features/signup/data/remote/models/Signup_response.dart';

@Injectable(as: SignupDao)
class SignupApiDaoImpl extends SignupDao {
  ApiManager apiManager;

  @factoryMethod
  SignupApiDaoImpl(this.apiManager);

  @override
  Future<Either<SignupResponse, String>> createAccount(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber}) async {
    try {
      var apiResponse =
          await apiManager.postRequest(path: Endpoints.signUp, body: {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "rePassword": password,
        "phone": phoneNumber
      });
      var response = SignupResponse.fromJson(apiResponse.data);

      if (response.message == "success") {
        return Left(response);
      } else {
        return Right(response.message!);
      }
    } catch (error) {
      return Right(error.toString());
    }
    throw UnimplementedError();
  }
}
