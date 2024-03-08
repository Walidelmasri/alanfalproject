import 'package:alanfalproject/models/safewindow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SafeWindowServices {
  String collection = "safewindow";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<SafeWindow>> getProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<SafeWindow> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(SafeWindow.fromSnapshot(product));
        }
        return products;
      });


  Future<List<SafeWindow>> searchProducts({String productName}) {
    // code to convert the first character to uppercase
    String searchKey = productName[0].toUpperCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get()
        .then((result) {
      List<SafeWindow> products = [];
      for (DocumentSnapshot product in result.docs) {
        products.add(SafeWindow.fromSnapshot(product));
      }
      return products;
    });
  }
}