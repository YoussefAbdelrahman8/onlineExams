import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/features/signup/domain/entities/Signup_entity.dart';
import 'package:online_exam_app/features/signup/domain/use_cases/signup_usecase.dart';

part 'signup_view_model_state.dart';

@injectable
class SignupViewModelCubit extends Cubit<SignupViewModelState> {
  SignupUseCase signupUseCase;
  @factoryMethod
  SignupViewModelCubit(this.signupUseCase) : super(SignupViewModelInitial());

  static SignupViewModelCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void signup({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    emit(LoadingState());
    var result = await signupUseCase.call(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phoneNumber: phoneNumber);
    result.fold((response) {
      emit(SuccessState(response));
    }, (error) {
      emit(ErrorState(error));
    });
  }
}
