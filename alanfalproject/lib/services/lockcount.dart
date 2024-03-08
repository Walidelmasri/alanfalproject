import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class LockCountService{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createLockCount(String name){
    var id = Uuid();
    String lockCountId = id.v1();

    _firestore.collection('lockcount').doc(lockCountId).set({'lockcount': name});
  }
  Future<List<DocumentSnapshot>> getLockCount() =>
      _firestore.collection('lockcount').get().then((snaps) {
        return snaps.docs;
      });

}