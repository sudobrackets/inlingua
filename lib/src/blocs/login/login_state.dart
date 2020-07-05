part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {
  String message;
  LoginSuccessState(this.message);
}

class LoginFailedState extends LoginState {
  String message;
  LoginFailedState(this.message);
}

class ProgressState extends LoginState {}
