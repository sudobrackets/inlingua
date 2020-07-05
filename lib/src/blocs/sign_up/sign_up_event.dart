part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SingUpRequestEvent extends SignUpEvent {
  Map<String, dynamic> payload;
  SingUpRequestEvent(this.payload);
}
