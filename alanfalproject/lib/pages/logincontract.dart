import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:alanfalproject/services/authservice.dart';
import 'package:alanfalproject/pages/home.dart';
import 'package:alanfalproject/models/user.dart';
import 'package:alanfalproject/services/users.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:alanfalproject/helpers/screen_navigation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:alanfalproject/pages/pincodescreen.dart';

class LoginContract extends StatefulWidget {
  @override
  _LoginContractState createState() => _LoginContractState();
}

class _LoginContractState extends State<LoginContract> {
  final numberKey = new GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;
  UserServices _userServices = UserServices();
  UserModel _userModel;
  UserModel get userModel => _userModel;



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: numberKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Enter phone number'),
                    onChanged: (val) {
                      setState(() {
                        this.phoneNo = val;
                      });
                    },
                  )),
//              codeSent ? Padding(
//                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                  child: TextFormField(
//                    keyboardType: TextInputType.phone,
//                    decoration: InputDecoration(hintText: 'Enter OTP'),
//                    onChanged: (val) {
//                      setState(() {
//                        this.smsCode = val;
//                      });
//                    },
//                  )) : Container(),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: RaisedButton(
                      child: Center(child:Text('Verify')),
                      onPressed: () async {
//                        codeSent ? await user.signInWithOTP(smsCode, verificationId):
//                        verifyPhone(phoneNo);
                        print(phoneNo);
                        changeScreenReplacement(context, PinCodeVerificationScreen(
                            phoneNo));
//                        changeScreenReplacement(context, Home());

                      })),
//        Padding(
//    padding: EdgeInsets.only(left: 25.0, right: 25.0),
//    child: RaisedButton(
//    child: Center(child:Text('Go to Home')),
//    onPressed: () {
//                        changeScreenReplacement(context, Home());
//
//    }))

    ],
          )),
    );
  }
//
//  Future<void> verifyPhone(phoneNo) async {
//    final user = Provider.of<UserProvider>(context, listen: false);
//    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
//      user.signInForPhone(authResult);
//    };
//
////    final PhoneVerificationFailed verificationfailed =
////        (AuthException authException) {
////      print('${authException.message}');
////    };
//
//    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
//      this.verificationId = verId;
//      setState(() {
//        this.codeSent = true;
//      });
//    };
//
//    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
//      this.verificationId = verId;
//    };
//
//    await FirebaseAuth.instance.verifyPhoneNumber(
//        phoneNumber: phoneNo,
//        timeout: const Duration(seconds: 5),
//        verificationCompleted: verified,
////        verificationFailed: verificationfailed,
//        codeSent: smsSent,
//        codeAutoRetrievalTimeout: autoTimeout);
//  }
}