import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_pass_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/use_cases/forget_pass_usecase.dart';

part 'forgetpassword_email_sent_view_model_state.dart';

@injectable
class ForgetPasswordEmailSentViewModelCubit
    extends Cubit<ForgetPasswordEmailSentViewModelState> {
  ForgetPasswordUseCase forgetPasswordUseCase;

  @factoryMethod
  ForgetPasswordEmailSentViewModelCubit(this.forgetPasswordUseCase)
      : super(ForgetPasswordEmailSentViewModelInitial());

  static ForgetPasswordEmailSentViewModelCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void senEmail({required String email}) async {
    emit(ForgetPasswordEmailSentLoadingState());
    var result = await forgetPasswordUseCase.call(email: email);
    result.fold((response) {
      emit(ForgetPasswordEmailSentSuccessState(response));
    }, (error) {
      emit(ForgetPasswordEmailSentErrorState(error));
    });
  }
}
