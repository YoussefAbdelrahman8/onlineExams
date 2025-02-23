import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/reset_pass_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/use_cases/reset_pass_usecase.dart';

part 'reset_pass_view_model_state.dart';

@injectable
class ResetPassViewModelCubit extends Cubit<ResetPassViewModelState> {
  ResetPasswordUseCase resetPasswordUseCase;

  ResetPassViewModelCubit(this.resetPasswordUseCase)
      : super(ResetPassViewModelInitial());

  static ResetPassViewModelCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void reset({required String email, required String newPassword}) async {
    emit(ResetPassViewModeLoadingState());
    var result =
        await resetPasswordUseCase.call(email: email, newPassword: newPassword);
    result.fold((response) {
      emit(ResetPassViewModeSuccessState(response));
    }, (error) {
      emit(ResetPassViewModeErrorState(error));
    });
  }
}
