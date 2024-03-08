import 'package:cloud_firestore/cloud_firestore.dart';

class SafeWindow{
  static const ID = "id";
//  static const CATEGORY = "category";
  static const NAME = "name";
  static const PRICE = "price";
  static const IMAGES = "images";

//  static const BRAND = "brand";
//  static const COLORS = "colors";
//  static const QUANTITY = "quantity";
//  static const SIZES = "sizes";
//  static const SALE = "sale";
//  static const FEATURED = "featured";
//  static const LOCKS = "locks";


  String _id;
  String _name;
  String _brand;
  String _category;
  String _picture;
  double _price;
  int _quantity;
  List _locks;
  List _sizes;
  bool _onSale;
  bool _featured;
  List _images;

//  getters
  String get name => _name;
  String get id => _id;
//  String get category => _category;
//  String get brand => _brand;
//  String get picture => _picture;
  double get price => _price;
  List get images => _images;

//  int get quantity => _quantity;
//  List get colors => _colors;
//  List get locks => _locks;
//  bool get onSale => _onSale;
//  bool get featured => _featured;

//  named constructure
  SafeWindow.fromSnapshot(DocumentSnapshot snapshot){
    Map data = snapshot.data();
    _name = data[NAME];
    _id = data[NAME];
//    _category = data[NAME];
//    _brand = data[BRAND];
    _price = data[PRICE];
    _images = data[IMAGES];

//    _quantity = data[QUANTITY];
//    _locks = data[LOCKS];
//    _onSale = data[SALE];
//    _featured = data[FEATURED];
//    _picture = data[PICTURE];
  }

}