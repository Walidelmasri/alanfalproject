//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:uuid/uuid.dart';
//
//class SizeService{
//  Firestore _firestore = Firestore.instance;
//  String price;
//
//
//  Future<List<DocumentSnapshot>> getSizes() =>
//      _firestore.collection('size').getDocuments().then((snaps){
////        print(snaps.documents.length);
//        return snaps.documents;
//      });
//  Future<List<DocumentSnapshot>> getSizePrice(String sizename) =>
//      _firestore.collection('size').where('sizeName', isEqualTo:sizename).getDocuments().then((snaps){
////        print(snaps.documents.length);
//        return snaps.documents;
//      });
//}