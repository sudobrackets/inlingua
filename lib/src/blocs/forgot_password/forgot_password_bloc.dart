import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:inlingua/src/data/repository/forgot_password/forgot_password_repository.dart';
import 'package:inlingua/src/models/forgot_password/forgot_password_response_model.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  @override
  ForgotPasswordState get initialState => ForgotPasswordInitial();

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ForgotRequestEvent) {
      yield* _handleForgotRequestEvent(event);
    }
  }

  Stream<ForgotPasswordState> _handleForgotRequestEvent(
      ForgotRequestEvent event) async* {
    yield ProgressState();
    final ForgotPasswordResponseModel signUpReponseModel =
        await ForgotPasswordRepository().forgotRequest(event.payload);
    if (!signUpReponseModel.isError) {
      yield ForgotPasswordSuccessState(signUpReponseModel.message);
    } else {
      yield ForgotPasswordFailedState(signUpReponseModel.message);
    }
  }
}
