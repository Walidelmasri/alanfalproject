import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:alanfaladmin/models/order.dart';
import 'package:alanfaladmin/service/order.dart';
import 'package:provider/provider.dart';
import 'package:alanfaladmin/provider/order.dart';

class OrderProvider with ChangeNotifier{

  OrderProvider.initialize(){
    getOrders();
  }
  OrderModel orderModel;
  OrderModel get _orderModel => orderModel;
  final _firestore = FirebaseFirestore.instance;
  OrderServices _orderServices = OrderServices();


  // public variables
  List<OrderModel> orders = [];


  getOrders()async{
    orders = await _orderServices.getAllOrders();
    notifyListeners();
  }
//  Future <Stream<QuerySnapshot>> getOrdersStream()async{
//    orders = await _orderServices.getAllOrders();
//    notifyListeners();
//    return _firestore.collection('posts').doc();
//  }


  Future<void> reloadOrderModel()async{
    await _orderServices.getAllOrders();
    notifyListeners();
  }

}