part of 'reset_pass_view_model_cubit.dart';

@immutable
sealed class ResetPassViewModelState {}

final class ResetPassViewModelInitial extends ResetPassViewModelState {}

final class ResetPassViewModeSuccessState extends ResetPassViewModelState {
  ResetPasswordEntity resetPasswordEntity;

  ResetPassViewModeSuccessState(this.resetPasswordEntity);
}

final class ResetPassViewModeErrorState extends ResetPassViewModelState {
  String? error;

  ResetPassViewModeErrorState(this.error);
}

final class ResetPassViewModeLoadingState extends ResetPassViewModelState {}
