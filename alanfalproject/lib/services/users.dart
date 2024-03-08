import 'dart:async';
import 'package:alanfalproject/models/cartitem.dart';
import 'package:alanfalproject/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserServices{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  createUser(Map<String, dynamic> data) async{
    try{
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
    }catch(e){
      print('ERROR: ${e.toString()}');
    }


  }

  Future<UserModel> getUserById(String id)=> _firestore.collection(collection).doc(id).get().then((doc){
    print("==========id is $id=============");
    debugPrint("==========NAME is ${doc.data()['name']}=============");
    debugPrint("==========NAME is ${doc.data()['name']}=============");
    debugPrint("==========NAME is ${doc.data()['name']}=============");
    debugPrint("==========NAME is ${doc.data()['name']}=============");

    print("==========NAME is ${doc.data()['name']}=============");
    print("==========NAME is ${doc.data()['name']}=============");
    print("==========NAME is ${doc.data()['name']}=============");

//    firebase auth:import oldclient.json --hash-algo=SCRYPT --hash-key=r+wTAICjciuX2vLHlsjc71324f1Y+OKk8mNkbMlfhSApjcfz0SK1HdTmR/OJHZydcBxq5dFLqSV7pMJJVyx5hQ== --salt-separator=Bw== --rounds=8 --mem-cost=14 --debug
    return UserModel.fromSnapshot(doc);

  });

  void addToCart({String userId, CartItemModel cartItem}){
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}){
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}