import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utiles/constant_manager.dart';

@singleton
class ApiManager {
  Dio dio = Dio(BaseOptions(baseUrl: ConstantManager.baseUrl));

  Future<Response> getRequest(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    var response = await dio.get(path,
        queryParameters: queryParameters, options: Options(headers: headers));
    return response;
  }

  Future<Response> postRequest(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.get(path, data: body, options: Options(headers: headers));
  }
}
