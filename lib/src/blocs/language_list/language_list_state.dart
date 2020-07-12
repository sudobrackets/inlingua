part of 'language_list_bloc.dart';

abstract class LanguageListState {}

class LanguageListInitial extends LanguageListState {}

class ProgressState extends LanguageListState {}

class LanguageListDoneState extends LanguageListState {
  List<LanguageListModel> languageList;
  LanguageListDoneState(this.languageList);
}

class LanguageListFailedState extends LanguageListState {
  String message;
  LanguageListFailedState(this.message);
}
