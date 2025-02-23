part of 'login_view_model_cubit.dart';

@immutable
sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}

final class LoginViewModelSuccessState extends LoginViewModelState {
  LoginEntity loginEntity;
  LoginViewModelSuccessState(this.loginEntity);
}

final class LoginViewModelErrorState extends LoginViewModelState {
  String error;

  LoginViewModelErrorState(this.error);
}

final class LoginViewModelLoadingState extends LoginViewModelState {}
