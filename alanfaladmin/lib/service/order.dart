//import 'package:alanfalproject/models/cartitem.dart';
import 'package:alanfaladmin/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderServices {
  String collection = "orders";
  final _firestore = FirebaseFirestore.instance;
  List<OrderModel> order = [];

  Future<List<OrderModel>> getAllOrders() async =>
      _firestore
          .collection(collection)
//          .where("userId", isEqualTo: userId)
          .get()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });


}
