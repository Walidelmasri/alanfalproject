//import 'package:cloud_firestore/cloud_firestore.dart';
//
//class UserModel {
//  static const NUMBER = "number";
//  static const ID = "id";
//
//  String _number;
//  String _id;
//
////  getters
//  String get number => _number;
//  String get id => _id;
//
//  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
//    _number = snapshot.data[NUMBER];
//    _id = snapshot.data[ID];
//  }
//}
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:alanfalproject/models/cartitem.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
//  static const STRIPE_ID = "stripeId";
  static const CART = "cart";
  static const ADDRESS = "address";
  static const PHONENUMBER = "phonenumber";


  String _name;
  String _email;
  String _id;
  String _address;
  String _phonenumber;
//  String _stripeId;
  double _priceSum = 0.0;


//  getters
  String get name => _name;

  String get email => _email;

  String get id => _id;

  String get phonenumber => _phonenumber;

  String get address => _address;

//  String get stripeId => _stripeId;

  // public variables
  List<CartItemModel> cart;
  double totalCartPrice;



  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    _phonenumber = snapshot.data()[PHONENUMBER];
    _address = snapshot.data()[ADDRESS];
//    _stripeId = snapshot.data[STRIPE_ID] ?? "";
    cart = _convertCartItems(snapshot.data()[CART]?? []);
    totalCartPrice = snapshot.data()[CART] == null ? 0 :getTotalPrice(cart: snapshot.data()[CART]);

  }

  List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  double getTotalPrice({List cart}){
    if(cart == null){
      return 0.0;
    }
    for(Map cartItem in cart){
      _priceSum += cartItem["totalprice"];
    }

    double total = _priceSum;
    return total;
  }
  void clearUser(){
    _name = 'Not Logged In';
    _email = 'Not Logged In';

  }
}