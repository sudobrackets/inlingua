part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchUserLoginEvent extends HomeEvent {}

class ProductActionEvent extends HomeEvent {
  String actionType;
  dynamic productItem;
  ProductActionEvent(this.actionType, this.productItem);
}
