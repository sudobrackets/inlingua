class CartListModel {
  List<CartList> cartList;

  CartListModel({this.cartList});

  CartListModel.fromJson(Map<String, dynamic> json) {
    if (json['cartList'] != null) {
      cartList = new List<CartList>();
      json['cartList'].forEach((v) {
        cartList.add(new CartList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartList != null) {
      data['cartList'] = this.cartList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartList {
  String id;
  String name;
  String decription;
  String price;
  String image;
  String count;
  String totalPrice;

  CartList(
      {this.id,
      this.name,
      this.decription,
      this.price,
      this.image,
      this.count,
      this.totalPrice});

  CartList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    decription = json['decription'];
    price = json['price'];
    image = json['image'];
    count = json['count'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['decription'] = this.decription;
    data['price'] = this.price;
    data['image'] = this.image;
    data['count'] = this.count;
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}
