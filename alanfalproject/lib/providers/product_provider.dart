
import 'package:alanfalproject/models/product.dart';
import 'package:alanfalproject/services/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{ 
  ProductServices _productServices = ProductServices();
  List<Product> products = [];
  List<Product> alldoors = [];
  List<Product> routerDoors = [];
  List<Product> moldedDoors = [];
  List<Product> finalProducts = [];
  List<Product> productsSearched = [];


  ProductProvider.initialize(){
    loadProducts();
    loadRouterDoors();
    loadMoldedDoors();
  }



  loadProducts()async{
    products = await _productServices.getProducts();
    notifyListeners();
  }
  loadRouterDoors()async{
    routerDoors = await _productServices.getRouterDoor();
    notifyListeners();
  }
  loadMoldedDoors()async{
    moldedDoors = await _productServices.getMoldedDoor();
    notifyListeners();
  }
  loadAllDoors()async{
    alldoors = await _productServices.getAllProducts();
    notifyListeners();
  }
  changeProducts() async {
    finalProducts = await _productServices.getProducts().then((response) {
      return finalProducts;
    });

    notifyListeners();
  }
  Future search({String productName})async{
    productsSearched = await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }

}