part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent {}

class ForgotRequestEvent extends ForgotPasswordEvent {
  Map<String, dynamic> payload;
  ForgotRequestEvent(this.payload);
}
