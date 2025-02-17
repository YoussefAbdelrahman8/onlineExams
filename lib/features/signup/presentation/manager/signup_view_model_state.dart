part of 'signup_view_model_cubit.dart';

@immutable
sealed class SignupViewModelState {}

final class SignupViewModelInitial extends SignupViewModelState {}
final class LoadingState extends SignupViewModelState {}
final class SuccessState extends SignupViewModelState {
  SignupEntity? signupEntity;
  SuccessState(this.signupEntity);
}
final class ErrorState extends SignupViewModelState {
  String? error;
  ErrorState(this.error);
}
