
import 'package:alanfalproject/models/safewindow.dart';
import 'package:alanfalproject/services/SafeWindowService.dart';
import 'package:flutter/material.dart';

class SafeWindowProvider with ChangeNotifier{
  SafeWindowServices safeWindowServices = SafeWindowServices();
  List<SafeWindow> products = [];
  List<SafeWindow> finalProducts = [];
  List<SafeWindow> productsSearched = [];


  SafeWindowProvider.initialize(){
    loadProducts();
  }



  loadProducts()async{
    products = await safeWindowServices.getProducts();
    notifyListeners();
  }

  changeProducts() async {
    finalProducts = await safeWindowServices.getProducts().then((response) {
      return finalProducts;
    });

    notifyListeners();
  }
  Future search({String productName})async{
    productsSearched = await safeWindowServices.searchProducts(productName: productName);
    notifyListeners();
  }

}