import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/verify_reset_code_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/use_cases/verify_reset_code_usecase.dart';

part 'verification_view_model_state.dart';

@injectable
class VerificationViewModelCubit extends Cubit<VerificationViewModelState> {
  VerifyResetCodeUseCase verifyResetCodeUseCase;

  @factoryMethod
  VerificationViewModelCubit(this.verifyResetCodeUseCase)
      : super(VerificationViewModelInitial());

  static VerificationViewModelCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void verify({required String resetCode}) async {
    emit(VerificationViewModelLoadingState());
    var result = await verifyResetCodeUseCase.call(resetCode: resetCode);
    result.fold((response) {
      emit(VerificationViewModelSuccessState(response));
    }, (error) {
      emit(VerificationViewModelErrorState(error));
    });
  }

}
