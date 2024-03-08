import 'package:alanfalproject/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductServices {
  String collection = "doors";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async =>
      _firestore.collection(collection).where('category', isEqualTo: 'Flash').get().then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });
  Future<List<Product>> getAllProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });

  Future<List<Product>> getRouterDoor() async =>
      _firestore.collection(collection).where('category', isEqualTo: 'Router').get().then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });
  Future<List<Product>> getMoldedDoor() async =>
      _firestore.collection(collection).where('category', isEqualTo: 'Molded').get().then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });

  Future<List<Product>> searchProducts({String productName}) {
    // code to convert the first character to uppercase
    String searchKey = productName[0].toUpperCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get()
        .then((result) {
      List<Product> products = [];
      for (DocumentSnapshot product in result.docs) {
        products.add(Product.fromSnapshot(product));
      }
      return products;
    });
  }
}