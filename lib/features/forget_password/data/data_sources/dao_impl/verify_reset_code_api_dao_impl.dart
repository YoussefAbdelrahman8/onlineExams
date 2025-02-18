import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/network/api_manager.dart';
import 'package:online_exam_app/core/network/endpoints.dart';
import 'package:online_exam_app/features/forget_password/data/data_sources/verify_reset_code_dao.dart';
import 'package:online_exam_app/features/forget_password/data/models/verify_reset_code_response.dart';

@Injectable(as: VerifyResetCodeDao)
class VerifyResetCodeApiDaoImpl extends VerifyResetCodeDao {
  ApiManager apiManager;

  @factoryMethod
  VerifyResetCodeApiDaoImpl(this.apiManager);

  @override
  Future<Either<VerifyResetCodeResponse, String>> verifyResetCode(
      {required String resetCode}) async {
    try {
      var apiResponse = await apiManager.postRequest(
        path: Endpoints.verifyResetCode,
        body: {"resetCode": resetCode},
      );
      var response = VerifyResetCodeResponse.fromJson(apiResponse.data);
      if (response.status == "success") {
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
