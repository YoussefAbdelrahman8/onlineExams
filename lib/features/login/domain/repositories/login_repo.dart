import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/login/domain/entities/Login_entity.dart';

abstract class LoginRepo {
  Future<Either<LoginEntity, String>> login(
      {required String email, required String password});
}
