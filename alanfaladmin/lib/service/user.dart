import 'package:alanfaladmin/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  String collection = "users";
  final _firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> getUsers() async =>
      _firestore.collection(collection).get().then((result) {
        List<UserModel> users = [];
        for (DocumentSnapshot product in result.docs) {
          users.add(UserModel.fromSnapshot(product));
        }
        return users;
      });


  Future<List<UserModel>> searchUsers({String userName}) {
    // code to convert the first character to uppercase
    String searchKey = userName[0].toUpperCase() + userName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get()
        .then((result) {
      List<UserModel> users = [];
      for (DocumentSnapshot user in result.docs) {
        users.add(UserModel.fromSnapshot(user));
      }
      return users;
    });
  }
}