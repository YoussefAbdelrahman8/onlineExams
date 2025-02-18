import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/network/api_manager.dart';
import 'package:online_exam_app/core/network/endpoints.dart';
import 'package:online_exam_app/features/forget_password/data/data_sources/forget_pass_dao.dart';
import 'package:online_exam_app/features/forget_password/data/models/Forget_pass_response.dart';

@Injectable(as: ForgetPasswordDao)
class ForgetPasswordApiDaoImpl extends ForgetPasswordDao {
  ApiManager apiManager;

  @factoryMethod
  ForgetPasswordApiDaoImpl(this.apiManager);

  @override
  Future<Either<ForgetPasswordResponse, String>> forgetPassword(
      {required String email}) async {
    try {
      var apiResponse = await apiManager.postRequest(
        path: Endpoints.forgetPassword,
        body: {"email": email},
      );
      var response = ForgetPasswordResponse.fromJson(apiResponse.data);
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
