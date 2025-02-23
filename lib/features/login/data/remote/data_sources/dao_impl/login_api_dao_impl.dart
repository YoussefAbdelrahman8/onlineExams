import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/network/api_manager.dart';
import 'package:online_exam_app/core/network/endpoints.dart';
import 'package:online_exam_app/features/login/data/remote/data_sources/login_dao.dart';
import 'package:online_exam_app/features/login/data/remote/models/Signin_response.dart';

@Injectable(as: LogInDao)
class LogInApiDaoImpl extends LogInDao {
  ApiManager apiManager;

  @factoryMethod
  LogInApiDaoImpl(this.apiManager);

  @override
  Future<Either<SigninResponse, String>> login(
      {required String email, required String password}) async {
    try {
      var apiResponse =
          await apiManager.postRequest(path: Endpoints.logIn, body: {
        "email": email,
        "password": password,
      });
      var response = SigninResponse.fromJson(apiResponse.data);
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
