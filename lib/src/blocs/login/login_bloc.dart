import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:inlingua/src/constants/storage_constants.dart';
import 'package:inlingua/src/data/repository/login/login_repository.dart';
import 'package:inlingua/src/data/store/app_storage.dart';
import 'package:inlingua/src/data/store/app_store.dart';
import 'package:inlingua/src/models/login/login_response_model.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is FetchUserLoginEvent) {
      yield* _handleFetchUserLoginEvent(event);
    }
  }

  Stream<LoginState> _handleFetchUserLoginEvent(
      FetchUserLoginEvent event) async* {
    yield ProgressState();
    final LoginResponseModel loginResponseModel =
        await LoginRepository().loginRequest(event.payload);
    if (!loginResponseModel.isError) {
      print('object ${loginResponseModel}');
      AppStore().setUserDetails(loginResponseModel);
      AppStorage().setData(USER_DETAILS, loginResponseModel.toJson());
      yield LoginSuccessState(loginResponseModel.message);
    } else {
      yield LoginFailedState(loginResponseModel.message);
    }
  }
}
