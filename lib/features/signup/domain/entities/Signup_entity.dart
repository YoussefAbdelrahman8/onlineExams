import 'package:online_exam_app/features/signup/data/remote/models/User.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjBmNDJmODZhMDI0ZjA2ZWEyNmY2OCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5NjUwMDk1fQ.sUClkM8FfFd-I_hkFd89BsFk9y3iMKoA_td39Ut_rMw"

class SignupEntity {
  SignupEntity({this.message, this.token, this.user});

  String? message;
  String? token;
  User? user;
}
