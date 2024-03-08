//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:uuid/uuid.dart';
//
//class LockTypeService{
//  FirebaseFirestore _firestore = Firestore.instance;
//  String price;
//
////  void createLockType(String name, String lockCount, String price){
////    var id = Uuid();
////    String brandId = id.v1();
////
////    _firestore.collection('locktype').document(brandId).setData({
////      'lockName': name,
////      'lockCount': lockCount,
////      'lockPrice': price
////    });
////  }
//  Future<List<DocumentSnapshot>> getLockTypes() =>
//      _firestore.collection('locktype').getDocuments().then((snaps){
////        print(snaps.documents.length);
//        return snaps.documents;
//      });
//  Future<List<DocumentSnapshot>> getLockPrice(String lockname) =>
//      _firestore.collection('locktype').where('lockName', isEqualTo:lockname).getDocuments().then((snaps){
////        print(snaps.documents.length);
//        return snaps.documents;
//      });
//}