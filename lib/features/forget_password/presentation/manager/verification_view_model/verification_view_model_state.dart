part of 'verification_view_model_cubit.dart';

@immutable
sealed class VerificationViewModelState {}

final class VerificationViewModelInitial extends VerificationViewModelState {}

final class VerificationViewModelLoadingState
    extends VerificationViewModelState {}

final class VerificationViewModelErrorState extends VerificationViewModelState {
  String? error;

  VerificationViewModelErrorState(this.error);
}

final class VerificationViewModelSuccessState
    extends VerificationViewModelState {
  VerifyResetCodeEntity verifyResetCodeEntity;

  VerificationViewModelSuccessState(this.verifyResetCodeEntity);
}
