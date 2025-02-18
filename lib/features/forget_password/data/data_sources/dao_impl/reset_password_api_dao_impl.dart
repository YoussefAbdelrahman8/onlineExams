import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/network/api_manager.dart';
import 'package:online_exam_app/core/network/endpoints.dart';

import 'package:online_exam_app/features/forget_password/data/models/Reset_pass_response.dart';

import '../reset_pass_dao.dart';

@Injectable(as: ResetPasswordDao)
class ResetPasswordApiDaoImpl extends ResetPasswordDao {
  ApiManager apiManager;

  @factoryMethod
  ResetPasswordApiDaoImpl(this.apiManager);

  @override
  Future<Either<ResetPasswordResponse, String>> resetPassword(
      {required String email, required String newPassword}) async {
    try {
      var apiResponse =
          await apiManager.putRequest(path: Endpoints.resetPassword, body: {
        "email": email,
        "newPassword": newPassword,
      });
      var response = ResetPasswordResponse.fromJson(apiResponse.data);
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
