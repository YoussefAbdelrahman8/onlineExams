import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/features/login/domain/entities/Login_entity.dart';
import 'package:online_exam_app/features/login/domain/use_cases/login_usecase.dart';

part 'login_view_model_state.dart';

@injectable
class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  LoginUseCase loginUseCase;

  @factoryMethod
  LoginViewModelCubit(this.loginUseCase) : super(LoginViewModelInitial());
  static LoginViewModelCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void login({required String email, required String password}) async {
    emit(LoginViewModelLoadingState());
    var result = await loginUseCase.call(email: email, password: password);
    result.fold((response) {
      emit(LoginViewModelSuccessState(response));
    }, (error) {
      emit(LoginViewModelErrorState(error));
    });
  }
}
