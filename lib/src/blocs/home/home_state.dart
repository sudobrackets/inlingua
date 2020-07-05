part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ProductListState extends HomeState {
  List<ProductList> productList;
  ProductListState(this.productList);
}

class CartDetailsChangeState extends HomeState {}

class CartDetailsState extends HomeState {
  String total;
  List<CartList> cartList;
  CartDetailsState({this.total, this.cartList});
}
