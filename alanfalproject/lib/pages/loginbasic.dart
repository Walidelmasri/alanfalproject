//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:alanfalproject/pages/homepage.dart';
//import 'package:alanfalproject/models/User.dart';
//import 'package:alanfalproject/pages/SignUp.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//
//class Login extends StatefulWidget {
//  @override
//  _LoginState createState() => _LoginState();
//}
//
//class _LoginState extends State<Login> {
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  final GoogleSignIn googleSignIn = new GoogleSignIn();
//  SharedPreferences preferences;
//  bool loading = false;
//  bool isLoggedIn = false;
//  bool isLoggedIncc = false;
//  final usersReference = Firestore.instance.collection("users");
//  final _formKey = GlobalKey<FormState>();
//  final _key = GlobalKey<ScaffoldState>();
//  TextEditingController _email = TextEditingController();
//  TextEditingController _password = TextEditingController();
//  final DateTime timestamp = DateTime.now();
//  User currentUser;
//
//  @override
//  void initState() {
//    super.initState();
//    isSignedIn();
////    googleSignIn.onCurrentUserChanged.listen((gSignInAccount) {
////      controlSignIn(gSignInAccount);
////    }, onError: (gError) {
////      print("Error Message: " + gError);
////    }
////    );
////    googleSignIn.signInSilently(suppressErrors: false).then((gSignInAccount) {
////      controlSignIn(gSignInAccount);
////    }).catchError((gError) {
////      print("Error Message: " + gError);
////    });
//  }
//
//  controlSignIn(GoogleSignInAccount signInAccount) async {
//    if (signInAccount != null) {
//      await handleSignIn();
//      setState(() {
//        isLoggedIn = true;
//      });
//    } else {
//      setState(() {
//        isLoggedIn = false;
//      });
//    }
//  }
//
//  loginUser() {
//    googleSignIn.signIn();
//  }
//
//  logoutUser() {
//    googleSignIn.signOut();
//  }
//
//  void isSignedIn() async {
//    setState(() {
//      loading = true;
//    });
////    final FirebaseAuth auth = FirebaseAuth.instance;
//    await firebaseAuth.currentUser().then((user){
//      if (user != null){
//        setState(() => isLoggedIn = true);
//      }
//    });
//    preferences = await SharedPreferences.getInstance();
//    isLoggedIn = await googleSignIn.isSignedIn();
//    if (isLoggedIn) {
//      Fluttertoast.showToast(msg: "Login Successfull");
//      setState(() {
//        loading = false;
//      });
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => HomePage()));
//    } else {
//      Fluttertoast.showToast(msg: "Login failed");
//      setState(() {
//        loading = false;
//      });
//    }
//  }
//
//  Future handleSignIn() async {
//    preferences = await SharedPreferences.getInstance();
//    setState(() {
//      loading = true;
//    });
//    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//    GoogleSignInAuthentication googleSignInAuthentication =
//    await googleSignInAccount.authentication;
//    final GoogleSignInAccount gCurrentUser = googleSignIn.currentUser;
//    DocumentSnapshot documentSnapshot =
//    await usersReference.document(gCurrentUser.id).get();
//    loginUser();
//    if (!documentSnapshot.exists) {
//      usersReference.document(gCurrentUser.id).setData({
//        "id": gCurrentUser.id,
//        "profileName": gCurrentUser.displayName,
//        "url": gCurrentUser.photoUrl,
//        "email": gCurrentUser.email,
//        "bio": "",
//        "timestamp": timestamp
//      });
//      documentSnapshot = await usersReference.document(gCurrentUser.id).get();
//    }
//    currentUser = User.fromDocument(documentSnapshot);
//    isSignedIn();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Stack(
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.only(top: 50.0),
//            child: Image.asset(
//              "images/back.png",
//              fit: BoxFit.fill,
//              //need to work on the width and height of this image
//              width: double.infinity,
////              height: double.infinity,
//            ),
//          ),
//
//          Padding(
//            padding: const EdgeInsets.only(top: 100.0),
//            child: Center(
//              child: Form(
//                key: _formKey,
//                child: Column(
//                  children: <Widget>[
//                    Expanded(child: Container(),),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(10.0),
//                        color: Colors.grey.withOpacity(0.8),
//                        elevation: 0.0,
//                        child: Padding(
//                          padding: const EdgeInsets.only(left: 12.0),
//                          child: TextFormField(
//                            controller: _email,
//                            decoration: InputDecoration(
//                              hintText: "Email",
//                              icon: Icon(Icons.alternate_email),
//                              disabledBorder: InputBorder.none,
//                              border: InputBorder.none,
//                              focusedBorder: InputBorder.none,
//                              enabledBorder: InputBorder.none,
//                              errorBorder: InputBorder.none,
//                            ),
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                Pattern pattern =
//                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                                RegExp regex = new RegExp(pattern);
//                                if (!regex.hasMatch(value))
//                                  return "Please make sure your email address is valid";
//                                else
//                                  return "";
//                              }
//                              return null;
//                            },
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(20.0),
//                        color: Colors.grey.withOpacity(0.8),
//                        elevation: 0.0,
//                        child: Padding(
//                          padding: const EdgeInsets.only(left: 12.0),
//                          child: TextFormField(
//                            cursorColor: Colors.black,
//                            controller: _password,
//                            decoration: InputDecoration(
//                              hintText: "Password",
//                              icon: Icon(Icons.lock_outline),
//                              disabledBorder: InputBorder.none,
//                              border: InputBorder.none,
//                              focusedBorder: InputBorder.none,
//                              enabledBorder: InputBorder.none,
//                              errorBorder: InputBorder.none,
//                            ),
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                return "The Password Field cannot be empty";
//                              } else if (value.length < 6) {
//                                return "The Password has to be at least 6 characters long";
//                              }
//                              return null;
//                            },
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(24.0),
//                        color: Colors.blue.withOpacity(0.8),
//                        elevation: 0.0,
//                        child: MaterialButton(
//                          onPressed: () {},
//                          minWidth: MediaQuery.of(context).size.width,
//                          child: Text(
//                            "Login",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 22.0,
//                            ),
//                          ),
//                        )
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: InkWell(
//                        onTap: (){
//                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
//                        },
//                        child: Text(
//                          "Don't have an account? Click Here to Sign Up",
//                          style: TextStyle(
//                            color: Colors.red,
//                            fontSize: 16.0,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//
//          Visibility(
//              visible: loading ?? true,
//              child: Center(
//                child: Container(
//                  alignment: Alignment.center,
//                  color: Colors.white.withOpacity(0.9),
//                  child: CircularProgressIndicator(
//                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                  ),
//                ),
//              ))
//        ],
//      ),
//
//    );
//  }
//
//  void dispose() {
//    super.dispose();
//  }
//}
