import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alanfalproject/pages/home.dart';
import 'package:alanfalproject/pages/login.dart';
import 'package:alanfalproject/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";
  //Handles Auth
//  handleAuth() {
//    return StreamBuilder(
//        stream: FirebaseAuth.instance.authStateChanges,
//        builder: (BuildContext context, snapshot) {
//          if (snapshot.hasData) {
//            return Home();
//          } else {
//            return Login();
//          }
//        });
//  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);



  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
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
}