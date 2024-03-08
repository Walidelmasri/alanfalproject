//import 'package:alanfalproject/helpers/style.dart';
//import 'package:alanfalproject/providers/auth.dart';
//import 'package:alanfalproject/pages/splash.dart';
//import 'package:alanfalproject/widgets/custom_button.dart';
//import 'package:alanfalproject/widgets/custom_text.dart';
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//
//class Login extends StatefulWidget {
//  @override
//  _LoginState createState() => _LoginState();
//}
//
//class _LoginState extends State<Login> {
//  TextEditingController number = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    final auth = Provider.of<AuthProvider>(context);
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: white,
//        body:  SingleChildScrollView(
//          child: auth.loading ? Splash() : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//            SizedBox(
//              height: 30,
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Image.asset(
//                  "images/cell.png",
//                  width: 160,
//                ),
//              ],
//            ),
//            SizedBox(height: 10),
//            CustomText(text: "Corona Out", size: 28, weight: FontWeight.bold),
//            SizedBox(height: 5),
//            RichText(
//                text: TextSpan(children: [
//              TextSpan(text: "Welcome to the"),
//              TextSpan(text: " Corona out", style: TextStyle(color: Colors.blue.shade900)),
//              TextSpan(text: " app"),
//            ], style: TextStyle(color: black))),
//            SizedBox(height: 10),
//            Padding(
//              padding: const EdgeInsets.only(left:12, right: 12, bottom: 12),
//              child: Container(
//                decoration: BoxDecoration(
//                    color: white,
//                    border: Border.all(color: black, width: 0.2),
//                    borderRadius: BorderRadius.circular(20),
//                    boxShadow: [
//                      BoxShadow(
//                          color: grey.withOpacity(0.3),
//                          offset: Offset(2, 1),
//                          blurRadius: 2
//                      )
//                    ]
//                ),
//                child: Padding(
//                  padding: const EdgeInsets.only(left:8.0),
//                  child: TextField(
//                    keyboardType: TextInputType.phone,
//                    controller: number,
//                    decoration: InputDecoration(
//                        icon: Icon(Icons.phone_android, color: grey),
//                        border: InputBorder.none,
//                        hintText: "+123 45678 786",
//                        hintStyle: TextStyle(
//                            color: grey,
//                            fontFamily: "Sen",
//                            fontSize: 18
//                        )
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            SizedBox(height: 5),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Text("After entering your phone number, click on verify to authenticate yourself! Then wait up to 20 seconds to get th OTP and procede", textAlign: TextAlign.center, style: TextStyle(color: grey),),
//            ),
//            SizedBox(height: 10),
//            CustomButton(msg: "Verify", onTap: (){
//              auth.verifyPhoneNumber(context, number.text);
//            })
//          ]),
//        ),
//      ),
//    );
//  }
//}
import 'package:alanfalproject/helpers/style.dart';
import 'package:alanfalproject/pages/SignUp.dart';
import 'package:alanfalproject/pages/home.dart';
import 'package:alanfalproject/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alanfalproject/pages/signupcontractno.dart';
import 'package:alanfalproject/pages/logincontract.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  final _mainPageKey = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Container(
      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage(
//            "images/curve.jpg"
//          ),
//        ),
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.4, 0.6, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.deepOrange[400],
            Colors.deepOrange[100],
            Colors.deepOrange[50],
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _mainPageKey,
        body:user.status == Status.Authenticating ? Loading() : ListView(
          children: <Widget>[
            Container(
//            color: Colors.white,
              child: Container(
//                    height: 250,

                child: Column(
                  children: <Widget>[

                    Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                        width: MediaQuery.maybeOf(context).size.width,
//                    height: 400,
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'images/logo.png',
                          width: 360.0,
                        )),
                  ),
                    Container(

                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,

                            borderRadius: BorderRadius.circular(16),
//                        boxShadow: [
//                          BoxShadow(
////                            color: Colors.deepOrange,
//                            blurRadius: 15.0, // has the effect of softening the shadow
//                          )
//                        ],
                          ),
                          child: Form(
                              key: _loginFormKey,
                              child: Column(
                                children: <Widget>[

//                            Divider(color: Colors.transparent,),
//                            Divider(color: Colors.transparent,),
//                            Divider(color: Colors.transparent,),

                          SizedBox(height: 20,),

                                  Divider(color: Colors.transparent,),


                                  Container(
                                    alignment: Alignment.bottomCenter,
//                          height: 400,

                                    child: Align(

//                          color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                                            child: Material(
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Colors.grey.withOpacity(0.3),
                                              elevation: 0.0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 12.0),
                                                child: TextFormField(
                                                  controller: _email,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Email",
                                                    icon: Icon(Icons.alternate_email),
                                                  ),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      Pattern pattern =
                                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                      RegExp regex = new RegExp(pattern);
                                                      if (!regex.hasMatch(value))
                                                        return 'Please make sure your email address is valid';
                                                      else
                                                        return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                                            child: Material(
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Colors.grey.withOpacity(0.3),
                                              elevation: 0.0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 12.0),
                                                child: TextFormField(
                                                  controller: _password,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Password",
                                                    icon: Icon(Icons.lock_outline),
                                                  ),
//                                              validator: (value) {
//                                                if (value.isEmpty) {
//                                                  return "The password field cannot be empty";
//                                                } else if (value.length < 6) {
//                                                  return "the password has to be at least 6 characters long";
//                                                }
//                                                return null;
//                                              },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                                            child: ButtonTheme(
                                              height: 50,
                                              child: TextButton(
                                                onPressed: () async{
                                                  if(_loginFormKey.currentState.validate()){
                                                    if(!await user.signIn(_email.text, _password.text))
                                                      _mainPageKey.currentState.showSnackBar(SnackBar(content: Text("Sign in failed")));
                                                    else
                                                      await user.signIn(_email.text, _password.text);
                                                    await user.user.reload();

                                                    if (user.user.emailVerified){
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) => Home(), fullscreenDialog: true));
                                                    } else {
                                                      print (user.user.emailVerified);
                                                      await user.user.sendEmailVerification().whenComplete(() => user.verifyEmail());

                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext context){
                                                            return Dialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(20.0)),
                                                              //this right here
                                                              child: Container(
                                                                height: 200,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(12.0),
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        'This is Your First Login, Please Check Your E-Mail For a Link and the Click to Verify',
                                                                        textAlign: TextAlign.center,
                                                                        style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 22),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 320.0,
                                                                        child: RaisedButton(
                                                                            onPressed: () {
//                                                                            Navigator.pop(context);
//
//                                                                          },
                                                                              Navigator.of(context).push(
                                                                                  MaterialPageRoute(
                                                                                      builder: (context) => Home(), fullscreenDialog: true));                                                                          },
                                                                            child: Text(
                                                                              "Got It!",
                                                                              style: GoogleFonts.changa(
                                                                                color: Colors.white,
                                                                                fontSize: 18,),
                                                                            ),
                                                                            color: Colors.blue),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );}


                                                      );

                                                    }

                                                  }
                                                },
                                                child: Center(
                                                    child: Text(
                                                      "SIGN IN".toUpperCase(),
                                                      style: GoogleFonts.changa(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.green.shade300,
                                                borderRadius: BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.green.shade200,
                                                      offset: Offset(1, -2),
                                                      blurRadius: 5),
                                                  BoxShadow(
                                                      color: Colors.green.shade200,
                                                      offset: Offset(-1, 2),
                                                      blurRadius: 5)
                                                ]),
                                          ),
                                          Container(
                                            margin:
                                            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                                            child: ButtonTheme(
                                              height: 50,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => new SignUp()));
                                                },
                                                child: Center(
                                                    child: Text(
                                                      "SIGN UP".toUpperCase(),
                                                      style: GoogleFonts.changa(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.red.shade300,
                                                borderRadius: BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.red.shade200,
                                                      offset: Offset(1, -2),
                                                      blurRadius: 5),
                                                  BoxShadow(
                                                      color: Colors.red.shade200,
                                                      offset: Offset(-1, 2),
                                                      blurRadius: 5)
                                                ]),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Old AlAnfal Client?",
                                                style: GoogleFonts.changa(color: Colors.black54, fontSize: 20,fontWeight: FontWeight.bold),
                                              ),
                                              TextButton(

                                                  onPressed: () {
//                                                user.userModel.clearUser();
//                                                  user.signInAsGuest();
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder: (context) => new LoginContract(), fullscreenDialog: true));
                                                    },
                                                  child: Text(
                                                    "LOGIN WITH PHONE NUMBER",
                                                    style: GoogleFonts.changa(
                                                        color: Colors.red.shade700,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 17),
                                                  ))
                                            ],
                                          ),


//                                          Padding(
//                                            padding:
//                                            const EdgeInsets.all(8.0),
//                                            child: Material(
////                                        borderRadius: BorderRadius.circular(20.0),
//                                                color: Colors.deepOrange,
////                                        elevation: 0.0,
//                                                child: MaterialButton(
//                                                  onPressed: () async{
//                                                    if(_loginFormKey.currentState.validate()){
//                                                      if(!await user.signIn(_email.text, _password.text))
//                                                        _mainPageKey.currentState.showSnackBar(SnackBar(content: Text("Sign in failed")));
//                                                      else
//                                                        await user.signIn(_email.text, _password.text);
//                                                      await user.user.reload();
//
//                                                      if (user.user.emailVerified){
//                                                        Navigator.of(context).push(
//                                                            MaterialPageRoute(
//                                                                builder: (context) => Home(), fullscreenDialog: true));
//                                                      } else {
//                                                        print (user.user.emailVerified);
//                                                        await user.user.sendEmailVerification().whenComplete(() => user.verifyEmail());
//
//                                                        showDialog(
//                                                            context: context,
//                                                            builder: (BuildContext context){
//                                                              return Dialog(
//                                                                shape: RoundedRectangleBorder(
//                                                                    borderRadius: BorderRadius.circular(20.0)),
//                                                                //this right here
//                                                                child: Container(
//                                                                  height: 200,
//                                                                  child: Padding(
//                                                                    padding: const EdgeInsets.all(12.0),
//                                                                    child: Column(
//                                                                      mainAxisAlignment: MainAxisAlignment.center,
//                                                                      crossAxisAlignment:
//                                                                      CrossAxisAlignment.start,
//                                                                      children: [
//                                                                        Text(
//                                                                          'This is Your First Login, Please Check Your E-Mail For a Link and the Click to Verify',
//                                                                          textAlign: TextAlign.center,
//                                                                          style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 22),
//                                                                        ),
//                                                                        SizedBox(
//                                                                          width: 320.0,
//                                                                          child: RaisedButton(
//                                                                              onPressed: () {
////                                                                            Navigator.pop(context);
////
////                                                                          },
//                                                                                Navigator.of(context).push(
//                                                                                    MaterialPageRoute(
//                                                                                        builder: (context) => Home(), fullscreenDialog: true));                                                                          },
//                                                                              child: Text(
//                                                                                "Got It!",
//                                                                                style: GoogleFonts.changa(
//                                                                                  color: Colors.white,
//                                                                                  fontSize: 18,),
//                                                                              ),
//                                                                              color: Colors.blue),
//                                                                        ),
//                                                                      ],
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              );}
//
//
//                                                        );
//
//                                                      }
//
//                                                    }
//                                                  },
//                                                  minWidth: MediaQuery.maybeOf(context).size.width,
//                                                  child: Text(
//                                                    "Login",
//                                                    textAlign: TextAlign.center,
//                                                    style: GoogleFonts.changa(
//                                                        color: Colors.white,
//                                                        fontWeight: FontWeight.bold,
//                                                        fontSize: 20.0),
//                                                  ),
//                                                )),
//                                          ),
//                                  Row(
//                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                    children: <Widget>[
//                                      Padding(
//                                        padding: const EdgeInsets.all(8.0),
//                                        child: Text(
//                                          "Forgot password",
//                                          textAlign: TextAlign.center,
//                                          style: TextStyle(
//                                            color: black,
//                                            fontWeight: FontWeight.w400,
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                          Row(
//                                            children: <Widget>[
//                                              Padding(
//
//                                                padding: const EdgeInsets.all(8.0),
////                                                child: MaterialButton(
////                                                    minWidth: MediaQuery.maybeOf(context).size.width - 16,
////
////                                                    onPressed: () {
////                                                      Navigator.push(context,
////                                                          MaterialPageRoute(builder: (context) => new SignUp()));
////                                                    },
////                                                    child: Text(
////                                                      "Sign Up",
////                                                      style: GoogleFonts.changa(
////                                                          fontSize: 20,
////                                                          color: Colors.white),
////                                                    ),
////                                                    color: Colors.green),),
//                                            ],
//                                          ),
//                                          Row(
//                                            children: <Widget>[
//                                              Padding(
//
//                                                padding: const EdgeInsets.all(8.0),
//                                                child: MaterialButton(
//                                                    minWidth: MediaQuery.maybeOf(context).size.width - 16,
//
//                                                    onPressed: () {
////                                                user.userModel.clearUser();
//                                                      user.signInAsGuest();
//                                                      Navigator.push(context,
//                                                          MaterialPageRoute(builder: (context) => new SignUpContract()));                },
//                                                    child: Text(
//                                                      "Sign Up with Contract Number",
//                                                      style: GoogleFonts.changa(
//                                                          color: Colors.black,
//                                                          fontSize: 20
//                                                      ),
//                                                    ),
//                                                    color: Colors.white),),
//                                            ],
//                                          ),
//                                          Row(
//                                            children: <Widget>[
//                                              Padding(
//
//                                                padding: const EdgeInsets.all(8.0),
//                                                child: MaterialButton(
//                                                    minWidth: MediaQuery.maybeOf(context).size.width - 16,
//
//                                                    child: Text(
//                                                      "Login with Phone Number",
//                                                      style: GoogleFonts.changa(
//                                                          color: Colors.black,
//                                                          fontSize: 20
//                                                      ),
//                                                    ),
//                                                    color: Colors.grey),),
//                                            ],
//                                          ),
                                          Container(
                                            margin:
                                            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                                            child: ButtonTheme(
                                              height: 50,
                                              child: TextButton(

                                                onPressed: () {
//                                                user.userModel.clearUser();
                                                  user.signInAsGuest();
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => new Home(), fullscreenDialog: true));
                                                  },
                                                child: Center(
                                                    child: Text(
                                                      "CONTINUE AS GUEST".toUpperCase(),
                                                      style: GoogleFonts.changa(
                                                          color: Colors.black54,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ),
                                            ),
//                                            decoration: BoxDecoration(
//                                                color: Colors.red.shade300,
//                                                borderRadius: BorderRadius.circular(5),
//                                                boxShadow: [
//                                                  BoxShadow(
//                                                      color: Colors.red.shade200,
//                                                      offset: Offset(1, -2),
//                                                      blurRadius: 5),
//                                                  BoxShadow(
//                                                      color: Colors.red.shade200,
//                                                      offset: Offset(-1, 2),
//                                                      blurRadius: 5)
//                                                ]),
                                          ),

//                                          Row(
//                                            children: <Widget>[
//                                              Padding(
//
//                                                padding: const EdgeInsets.all(8.0),
//                                                child: MaterialButton(
//                                                    minWidth: MediaQuery.maybeOf(context).size.width - 16,
//
//                                                    child: Text(
//                                                      "Continue as Guest",
//                                                      style: GoogleFonts.changa(
//                                                          color: Colors.black,
//                                                          fontSize: 20
//                                                      ),
//                                                    ),
//                                                    color: Colors.white),),
//                                            ],
//                                          ),
//                                    Container(
//                                      decoration: BoxDecoration(
////                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                                          color: Colors.white
//                                      ),
//                                      child: Container(
//                                        child: Padding(
//                                            padding: EdgeInsets.all(15),
//                                            child: Image.asset(
//                                              "images/aboutus/aboutusgif1.gif",
//                                              height: 250.0,
//                                            )
//                                        ),
//                                      ),
//                                    ),
                                        ],
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 30,),

                                ],
                              )),

                        ),
                      ),
                    ),],
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }


}
