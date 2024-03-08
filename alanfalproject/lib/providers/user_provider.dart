import 'dart:async';

import 'package:alanfalproject/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alanfalproject/services/users.dart';
import 'package:alanfalproject/models/order.dart';
import 'package:uuid/uuid.dart';
import 'package:alanfalproject/models/product.dart';
import 'package:alanfalproject/models/safewindow.dart';
import 'package:alanfalproject/models/cartitem.dart';
import 'package:alanfalproject/services/order.dart';
import 'package:alanfalproject/pages/home.dart';
import 'package:alanfalproject/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alanfalproject/helpers/screen_navigation.dart';

enum Status{Uninitialized, Authenticated, Authenticating, Unauthenticated}

class UserProvider with ChangeNotifier{
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  User get user => _user;
//  FirebaseFirestore.initializeApp();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;
  UserModel get userModel => _userModel;
  OrderServices _orderServices = OrderServices();
  List<CartItemModel> cart;
  static const LOGGED_IN = "loggedIn";
//  FirebaseAuth _auth = FirebaseAuth.instance;

//  Firestore _firestore = Firestore.instance;
  TextEditingController phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  bool loggedIn;
  bool loading = false;


  // public variables
  List<OrderModel> orders = [];

  UserProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<void> signInAsGuest(){
//    _auth.signInAnonymously();
    notifyListeners();

  }

  //need to differentiate between new and old user
  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
        _userModel = await _userServices.getUserById(value.user.uid);
        _status = Status.Authenticated;
        notifyListeners();
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }
  Future<bool> signInWithContract(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
        _userModel = await _userServices.getUserById(value.user.uid);
        _status = Status.Authenticated;
        notifyListeners();
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }


  Future<bool> signUp(String name,String email, String password, String phonenumber, String address)async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user){
        _firestore.collection('users').doc(user.user.uid).set({
          'name':name,
          'email':email,
          'uid':user.user.uid,
          'cart': cart,
          'phonenumber': phonenumber,
          'address': address

        });
      });
      return true;
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }
  Future<bool> signUpwithContract(String email, String password, String contractNo)async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user){
        _firestore.collection('users').doc(user.user.email).update({

//          'name':name,
//          'email':email,
          'uid':user.user.uid,
//          'cart': cart,
//          'phonenumber': phonenumber,
//          'address': address

        });
//        _firestore.collection('users').where('email', isEqualTo: contractNo).firestore.document(user.user.uid).setData({
//                    'uid':user.user.uid,
//
//        });
      });
      return true;
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }
  Future signOut()async{
    await _auth.signOut();
    _status = Status.Unauthenticated;
    _user == null;
//    userModel.clearUser();
    notifyListeners();
    return Future.delayed(Duration.zero);
  }



  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          switch (status){
            case Status.Authenticated:
              return Home();

              default: return Login();
          }
//          if (snapshot.hasData) {
//            return Home();
//          } else {
//            return Login();
//          }
        });
  }
  Future<bool> addToCart(
      {Product product, double totalprice, String locktype, String doorsize, String color, String dalfa, String notes}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> cart = _userModel.cart;

      Map cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.images[0],
        "productId": product.id,
        "totalprice": totalprice,
        "locktype": locktype,
        "doorsize": doorsize,
        "doordalfa": dalfa,
//        "size": size,
        "color": color,
        "notes": notes
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> addSafeWindowToCart(
      {SafeWindow product, double totalprice, String wmotortype, String windowwidth, String color, String windowheight, String wdalfatype, String rolling, String notes}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> cart = _userModel.cart;

      Map cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.images[0],
        "productId": product.id,
        "totalprice": totalprice,
        "windowwidth": windowwidth,
        "windowheight": windowheight,
        "color": color,
        "wdalfatype": wdalfatype,
        "wmotortype": wmotortype,
        "rolling": rolling,
        "notes": notes
//        "size": size,
//        "color": color
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }
  Future<bool> addRollingToCart(
      {SafeWindow product,String imgurl, double totalprice, String wmotortype, String windowwidth, String color, String windowheight, String wdalfatype, String rolling, String notes}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> cart = _userModel.cart;

      Map cartItem = {
        "id": cartItemId,
        "name": rolling,
        "image": imgurl,
//        "productId": product.id,
        "totalprice": totalprice,
        "windowwidth": windowwidth,
        "windowheight": windowheight,
        "color": color,
//        "wdalfatype": wdalfatype,
        "wmotortype": wmotortype,
        "notes": notes
//        "rolling": rolling
//        "size": size,
//        "color": color
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }
  Future<bool> removeFromCart({CartItemModel cartItem})async{
    print("THE PRODUC IS: ${cartItem.toString()}");

    try{
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    }catch(e){
      print("THE ERROR ${e.toString()}");
      return false;
    }

  }

  getOrders()async{
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    print(_user.email);
    notifyListeners();
  }

  Future<void> reloadUserModel()async{
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }
  Future<void> readPrefs()async{
    await Future.delayed(Duration(seconds: 3)).then((v)async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      loggedIn = prefs.getBool(LOGGED_IN) ?? false;

      if(loggedIn){
        _user = await _auth.currentUser;
        _userModel = await _userServices.getUserById(_user.uid);
        _status = Status.Authenticated;
        notifyListeners();
        return;
      }

      _status = Status.Unauthenticated;
      notifyListeners();

    });
  }

  Future<void> verifyPhoneNumber(BuildContext context, String number) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value) {
        print('sign in');
      });
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: number.trim(), // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential.toString() + "lets make this work");
          },
//          verificationFailed: (AuthException exceptio) {
//            print('${exceptio.message} + something is wrong');
//          }
          );
    } catch (e) {
      handleError(e, context);
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  signInWithNumber(BuildContext context) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final UserCredential  user = await _auth.signInWithCredential(credential);
      final User currentUser = await _auth.currentUser;
      assert(user.user.uid == currentUser.uid);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(LOGGED_IN, true);
      loggedIn =  true;
      if (user != null) {
        _userModel = await _userServices.getUserById(user.user.uid);
        if(_userModel == null){
          _createUser(id: user.user.uid, number: user.user.phoneNumber);
        }

        loading = false;
        Navigator.of(context).pop();
        changeScreenReplacement(context, Home());
      }
      loading = false;

      Navigator.of(context).pop();
      changeScreenReplacement(context, Home());
      notifyListeners();

    } catch (e) {
      print("${e.toString()}");
    }

  }


  void _createUser({String id, String number}){
    _userServices.createUser({
      "id": id,
      "number": number,

    });
  }
  handleError(error, BuildContext context) {
    print(error);
    errorMessage = error.toString();
    notifyListeners();
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        print("The verification code is invalid");
        break;
      default:
        errorMessage = error.message;
        break;
    }
    notifyListeners();
  }

  Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return  AlertDialog(
            title: Text('Enter SMS Code'),
            content: Container(
              height: 85,
              child: Column(children: [
                TextField(
                  onChanged: (value) {
                    this.smsOTP = value;
                  },
                ),
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                onPressed: ()async {
                  loading = true;
                  notifyListeners();
                    if (user != null) {
                      _userModel = await _userServices.getUserById(user.uid);
                      if(_userModel == null){
                        _createUser(id: user.uid, number: user.phoneNumber);
                      }
                      Navigator.of(context).pop();
                      loading = false;
                      notifyListeners();
                      changeScreenReplacement(context, Home());
                    } else {
                      loading = true;
                      notifyListeners();
                      Navigator.of(context).pop();
                      loading = false;
                      signInWithNumber(context);
                    }

                },
              )
            ],
          );
        });
  }


  //Heres the new one
  //Sign out
//  signOut() {
//    FirebaseAuth.instance.signOut();
//  }

  //SignIn
  signInForPhone(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds).then((value) async =>
    _userModel = await _userServices.getUserById(value.user.uid));
    _status = Status.Authenticated;
    notifyListeners();
  }

  signInWithOTP(smsCode, verId) async {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    await signInForPhone(authCreds);
  }
  verifyEmail(){
    user.emailVerified == true;
    notifyListeners();
}
  void createMaintananceNote({String name, String phonenumber, String note, String id, String userid, String address}) {
    _firestore.collection("maintanance").doc(id).set({
      "id": id,
      "createdAt": DateTime.now(),
      "note": note,
      "phonenumber": phonenumber,
      "name": name,
      "address": address,
      "uid": userid,
      "state": "Pending Confirmation"
    });
  }

}