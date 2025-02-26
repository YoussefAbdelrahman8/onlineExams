import 'package:online_exam_app/features/login/data/remote/models/User.dart';

/// code : ""
/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjNkODkwODZhMDI0ZjA2ZWEyN2MyZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQwMzM4OTkyfQ.k8AzlOsjhaoE_Mi9MvwlngULcesqbBWNXxokaiXypNs"

class LoginEntity {
  LoginEntity({this.code, this.message, this.token, this.user});

  String? code;
  String? message;
  String? token;
  User? user;
}
