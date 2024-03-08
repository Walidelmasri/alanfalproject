
import 'package:alanfalproject/models/product.dart';
import 'package:alanfalproject/services/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{ 
  ProductServices _productServices = ProductServices();
  List<Product> products = [];
  List<Product> finalProducts = [];
  List<Product> productsSearched = [];
  String category;


  ProductProvider.initialize(){
    loadProducts(category);
  }



  loadProducts(category)async{
    products = await _productServices.getProducts(category);
    notifyListeners();
  }

  changeProducts(String newCategory) async {
    finalProducts = await _productServices.getProducts(newCategory).then((response) {
      return finalProducts;
    });

    notifyListeners();
  }
  Future search({String productName})async{
    productsSearched = await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }

}