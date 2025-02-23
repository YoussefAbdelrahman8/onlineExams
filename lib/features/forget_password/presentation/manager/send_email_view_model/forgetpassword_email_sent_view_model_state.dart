part of 'forgetpassword_email_sent_view_model_cubit.dart';

@immutable
sealed class ForgetPasswordEmailSentViewModelState {}

final class ForgetPasswordEmailSentViewModelInitial
    extends ForgetPasswordEmailSentViewModelState {}

final class ForgetPasswordEmailSentSuccessState
    extends ForgetPasswordEmailSentViewModelState {
  ForgetPassEntity forgetPassEntity;

  ForgetPasswordEmailSentSuccessState(this.forgetPassEntity);
}

final class ForgetPasswordEmailSentErrorState
    extends ForgetPasswordEmailSentViewModelState {
  String? error;

  ForgetPasswordEmailSentErrorState(this.error);
}

final class ForgetPasswordEmailSentLoadingState
    extends ForgetPasswordEmailSentViewModelState {}
