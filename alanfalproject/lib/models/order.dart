import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alanfalproject/models/cartitem.dart';
class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id;
  String _description;
  String _userId;
  String _status;
  int _createdAt;
  int _total;


//  getters
  String get id => _id;

  String get description => _description;

  String get userId => _userId;

  String get status => _status;

  int get total => _total;

  int get createdAt => _createdAt;

  // public variable
  List<CartItemModel> cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _description = snapshot.data()[DESCRIPTION];
    _total = snapshot.data()[TOTAL];
    _status = snapshot.data()[STATUS];
    _userId = snapshot.data()[USER_ID];
//    _createdAt = snapshot.data[CREATED_AT];
    cart = _convertCartItems(snapshot.data()[CART]?? []);
  }
  Map toMap() => {
    ID: _id,
//    IMAGE: _image,
    USER_ID: _userId,
//    PRODUCT_ID: _productId,
    TOTAL: _total.toString(),
    STATUS: _status
//    SIZE: _size,
//    LOCKTYPE: _locktype

  };

  List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
}
