import 'package:alanfalproject/models/cartitem.dart';
import 'package:alanfalproject/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderServices{
  String collection = "orders";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createOrder({String phonenumber, String email, String address, String userId ,String id,String description,String status ,String username, List<CartItemModel> cart, double totalPrice, int cartlength}) {
    List<Map> convertedCart = [];

    for(CartItemModel item in cart){
      convertedCart.add(item.toMap());
    }

    _firestore.collection(collection).doc(id).set({
      "userId": userId,
      "id": id,
      "cart": convertedCart,
      "cartlength": cartlength,
      "total": totalPrice,
      "createdAt": DateTime.now(),
      "description": description,
      "status": status,
      "username": username,
      "email": email,
      "address": address,
      "phonenumber": phonenumber
    });
  }

  Future<List<OrderModel>> getUserOrders({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .get()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });

}