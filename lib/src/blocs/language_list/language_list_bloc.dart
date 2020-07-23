import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:inlingua/src/data/repository/language_list/language_list_repository.dart';
import 'package:inlingua/src/models/language_list/language_list_response_mdoel.dart';
part 'language_list_event.dart';
part 'language_list_state.dart';

class LanguageListBloc extends Bloc<LanguageListEvent, LanguageListState> {
  @override
  LanguageListInitial get initialState => LanguageListInitial();

  @override
  Stream<LanguageListState> mapEventToState(
    LanguageListEvent event,
  ) async* {
    if (event is FetchLanguageListEvent) {
      yield* _handleFetchLanguageListEvent();
    }
  }

  Stream<LanguageListState> _handleFetchLanguageListEvent() async* {
    yield ProgressState();
    final LanguageListResponseModel signUpReponseModel =
        await LanguageListRepository().fetchList();
    if (!signUpReponseModel.isError) {
      yield LanguageListDoneState(signUpReponseModel.languageList);
    } else {
      yield LanguageListFailedState(signUpReponseModel.message);
    }
  }
}
