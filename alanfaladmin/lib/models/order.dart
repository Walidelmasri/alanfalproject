import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alanfaladmin/models/cartitem.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const ADDRESS = "address";
  static const PHONENUM = "phonenumber";
  static const EMAIL = "email";
  static const NAME = "username";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";
  static const CARTLENGTH = 'cartlength';

  String _id;
  String _description;
  String _userId;
  String _address;
  String _phonenumber;
  String _email;
  String _name;
  String _status;
  int _createdAt;
  double _total;
  int _cartlength;


//  getters
  String get id => _id;

  String get description => _description;

  String get userId => _userId;

  String get address => _address;

  String get phonenumber => _phonenumber;

  String get email => _email;

  String get name => _name;

  String get status => _status;

  double get total => _total;

  int get createdAt => _createdAt;

  int get cartlength => _cartlength;

  // public variable
  List<CartItemModel> cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _description = snapshot.data()[DESCRIPTION];
    _total = snapshot.data()[TOTAL];
    _status = snapshot.data()[STATUS];
    _userId = snapshot.data()[USER_ID];
    _address = snapshot.data()[ADDRESS];
    _email = snapshot.data()[EMAIL];
    _name = snapshot.data()[NAME];
    _phonenumber = snapshot.data()[PHONENUM];
    _cartlength = snapshot.data()[CARTLENGTH];
//    _createdAt = snapshot.data[CREATED_AT];
    cart = _convertCartItems(snapshot.data()[CART]?? []);
  }
  Map toMap() => {
    ID: _id,
//    IMAGE: _image,
    USER_ID: _userId,
//    PRODUCT_ID: _productId,
    TOTAL: _total.toString(),
    ADDRESS: _address,
    EMAIL: _email,
    PHONENUM: _phonenumber,
    NAME: _name,
    STATUS: _status,
//    SIZE: _size,
    CARTLENGTH: _cartlength,
    CART: cart

  };


  List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
  void acceptOrder(){
    _status = 'Accepted';

  }
}
