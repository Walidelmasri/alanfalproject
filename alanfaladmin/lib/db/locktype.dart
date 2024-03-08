import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class LockTypeService{
  final _firestore = FirebaseFirestore.instance;

  void createLockType(String name, String lockCount, String price){
    var id = Uuid();
    String brandId = id.v1();

    _firestore.collection('locktype').doc(brandId).set({
      'lockName': name,
      'lockCount': lockCount,
      'lockPrice': price
    });
  }
  Future<List<DocumentSnapshot>> getLockTypes() =>
      _firestore.collection('brand').get().then((snaps){
//        print(snaps.documents.length);
        return snaps.docs;
  });
}