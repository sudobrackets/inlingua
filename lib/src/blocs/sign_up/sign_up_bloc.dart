import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:inlingua/src/data/repository/sign_up/sign_up_repository.dart';
import 'package:inlingua/src/models/sign_up/sign_up_response_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  @override
  SignUpState get initialState => SignUpInitial();

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SingUpRequestEvent) {
      yield* _handleSingUpEvent(event);
    }
  }

  Stream<SignUpState> _handleSingUpEvent(SingUpRequestEvent event) async* {
    yield ProgressState();
    final SignUpReponseModel signUpReponseModel =
        await SignUpRepository().signUpRequest(event.payload);
    if (!signUpReponseModel.isError) {
      yield SignUpSuccessState(signUpReponseModel.message);
    } else {
      yield SignUpFailedState(signUpReponseModel.message);
    }
  }
}
