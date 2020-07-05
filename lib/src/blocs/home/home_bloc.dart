import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:inlingua/src/constants/app_constants.dart';
import 'package:inlingua/src/data/repository/home/home_repository.dart';
import 'package:inlingua/src/models/home/cart_list_model.dart';
import 'package:inlingua/src/models/home/product_list_response_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitial();
  CartDetailsState cartDetailsState = CartDetailsState();
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchUserLoginEvent) {
      yield* _handleFetchUserLoginEvent(event);
    } else if (event is ProductActionEvent) {
      yield* _handleProductActionEvent(event);
    }
  }

  Stream<HomeState> _handleFetchUserLoginEvent(
      FetchUserLoginEvent event) async* {
    final ProductListResponseModel userListModel =
        await HomeRepository().fetchProductList();
    yield ProductListState(userListModel.productList);
  }

  Stream<HomeState> _handleProductActionEvent(ProductActionEvent event) async* {
    debugPrint('${cartDetailsState.cartList}');
    if (cartDetailsState.cartList != null &&
        cartDetailsState.cartList.isNotEmpty) {
      final List<CartList> cartList = cartDetailsState.cartList;
      final int findIndex = cartList
          .indexWhere((CartList element) => element.id == event.productItem.id);
      if (event.actionType == AppConstants.PLUS) {
        if (findIndex != -1) {
          final int count = int.parse(cartList[findIndex].count) + 1;
          cartList[findIndex].count = (count).toString();
          cartList[findIndex].totalPrice =
              (count * double.parse(cartList[findIndex].price)).toString();
        } else {
          final Map<String, dynamic> productItem = event.productItem.toJson();
          productItem['count'] = '1';
          productItem['totalPrice'] =
              (1 * double.parse(event.productItem.price)).toString();
          cartList.add(CartList.fromJson(productItem));
        }
      } else {
        if (cartList[findIndex].count == '1') {
          cartList.removeAt(findIndex);
        } else {
          final int count = int.parse(cartList[findIndex].count) - 1;
          cartList[findIndex].count = (count).toString();
          cartList[findIndex].totalPrice =
              (count * double.parse(cartList[findIndex].price)).toString();
        }
      }
      yield CartDetailsChangeState();
      yield cartDetailsState
        ..cartList = cartList
        ..total = cartList
            .fold(0, (a, b) => a + double.parse(b.totalPrice))
            .toString();
    } else {
      List<CartList> cartList = [];
      Map<String, dynamic> productItem = event.productItem.toJson();
      productItem['count'] = '1';
      productItem['totalPrice'] =
          (1 * double.parse(event.productItem.price)).toString();
      cartList.add(CartList.fromJson(productItem));
      yield CartDetailsChangeState();
      yield cartDetailsState
        ..cartList = cartList
        ..total = productItem['totalPrice'];
    }
  }
}
