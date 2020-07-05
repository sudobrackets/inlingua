part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  String message;
  SignUpSuccessState(this.message);
}

class SignUpFailedState extends SignUpState {
  String message;
  SignUpFailedState(this.message);
}

class ProgressState extends SignUpState {}
