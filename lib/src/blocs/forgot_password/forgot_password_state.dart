part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  String message;
  ForgotPasswordSuccessState(this.message);
}

class ForgotPasswordFailedState extends ForgotPasswordState {
  String message;
  ForgotPasswordFailedState(this.message);
}
class ProgressState extends ForgotPasswordState {
}