import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class SafetyWindowService{
  final _firestore = FirebaseFirestore.instance;
  String ref = 'safewindow';

  void createProduct(String name, String category, String price){
    var id = Uuid();
    String productId = id.v1();

    _firestore.collection('safewindow').doc(productId).set({
      'productname': name,
      'category': category,
      'price': price
    });
  }
  void uploadProduct(Map<String, dynamic> data) {
    var id = Uuid();
    String productId = id.v1();
    data["id"] = productId;
    _firestore.collection(ref).doc(productId).set(data);
  }

  Future<List<DocumentSnapshot>> getProducts() =>
      _firestore.collection('products').get().then((snaps){
        print(snaps.docs.length);
        return snaps.docs;
      });
}