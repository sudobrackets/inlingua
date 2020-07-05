part of 'login_bloc.dart';

abstract class LoginEvent {}

class FetchUserLoginEvent extends LoginEvent {
  Map payload;
  FetchUserLoginEvent(this.payload);
}
