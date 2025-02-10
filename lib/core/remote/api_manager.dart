import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio(BaseOptions(baseUrl: ""));

  Future<Response> getRequest(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    var response = await dio.get(path,
        queryParameters: queryParameters, options: Options(headers: headers));
    return response;
  }

  postRequest(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    dio.get(path, data: body, options: Options(headers: headers));
  }
}
