//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:alanfalproject/db/users.dart';
//import 'package:alanfalproject/pages/homepage.dart';
//
//class SignUp extends StatefulWidget {
//  @override
//  _SignUpState createState() => _SignUpState();
//}
//
//class _SignUpState extends State<SignUp> {
//  bool loading = false;
//  bool isLoading = false;
//  final _formKey = GlobalKey<FormState>();
//  final _key = GlobalKey<ScaffoldState>();
//  FirebaseAuth auth = FirebaseAuth.instance;
//  UserServices userServices = UserServices();
//  TextEditingController _email = TextEditingController();
//  TextEditingController _nameTextController = TextEditingController();
//  TextEditingController _password = TextEditingController();
//  String gender;
//  String groupValue = "Male";
//  bool hidePass = true;
//  bool hideConfirmPass = true;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        resizeToAvoidBottomPadding: true,
//      body: Stack(
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.only(top: 10.0),
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
//            padding: const EdgeInsets.only(top: 10.0),
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
//                            cursorColor: Colors.black,
//                            controller: _nameTextController,
//                            decoration: InputDecoration(
//                              hintText: "Enter Your Name",
//                              icon: Icon(Icons.person_outline),
//                              disabledBorder: InputBorder.none,
//                              border: InputBorder.none,
//                              focusedBorder: InputBorder.none,
//                              enabledBorder: InputBorder.none,
//                              errorBorder: InputBorder.none,
//                            ),
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                return "The Name Field cannot be empty";
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
//                          child: ListTile(
//                            title: TextFormField(
//                              cursorColor: Colors.black,
//                              controller: _password,
//                              obscureText: hidePass,
//                              decoration: InputDecoration(
//                                hintText: "Password",
//                                icon: Icon(Icons.lock_outline),
//                                disabledBorder: InputBorder.none,
//                                border: InputBorder.none,
//                                focusedBorder: InputBorder.none,
//                                enabledBorder: InputBorder.none,
//                                errorBorder: InputBorder.none,
//                              ),
//                              validator: (value) {
//                                if (value.isEmpty) {
//                                  return "The Password Field cannot be empty";
//                                } else if (value.length < 6) {
//                                  return "The Password has to be at least 6 characters long";
//                                }
//                                return null;
//                              },
//                            ),
//                            trailing: IconButton(
//                              icon: Icon(Icons.remove_red_eye),
//                              onPressed: (){
//                                setState(() {
//                                  hidePass = false;
//                                });
//                              },
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
////                    Row(
////                      children: <Widget>[
////                        Expanded(
////                            child: ListTile(
////                                title: Text("Male"),
////                                trailing: Radio(value: "Male", groupValue: groupValue, onChanged: (e) => valueChanged(e),),
////                                )),
////                        Expanded(
////                            child: ListTile(
////                              title: Text("Female"),
////                              trailing: Radio(value: "Female", groupValue: groupValue, onChanged: (e) => valueChanged(e),),
////                            )),                      ],
////                    ),
////                    Padding(
////                      padding: const EdgeInsets.all(8.0),
////                      child: Material(
////                        borderRadius: BorderRadius.circular(20.0),
////                        color: Colors.grey.withOpacity(0.8),
////                        elevation: 0.0,
////                        child: Padding(
////                          padding: const EdgeInsets.only(left: 12.0),
////                          child: ListTile(
////                            title: TextFormField(
////                              cursorColor: Colors.black,
////                              controller: _confirmPasswordController,
////                              obscureText: hideConfirmPass,
////                              decoration: InputDecoration(
////                                hintText: "Confirm Password",
////                                icon: Icon(Icons.lock_outline),
////                                disabledBorder: InputBorder.none,
////                                border: InputBorder.none,
////                                focusedBorder: InputBorder.none,
////                                enabledBorder: InputBorder.none,
////                                errorBorder: InputBorder.none,
////                              ),
////                              validator: (value) {
////                                if (value.isEmpty) {
////                                  return "The Password Field cannot be empty";
////                                } else if (value.length < 6) {
////                                  return "The Password has to be at least 6 characters long";
////                                } else if (_confirmPasswordController.text != value){
////                                  return "The Passwords do not match";
////                                }
////                                return null;
////                              },
////                            ),
////                            trailing: IconButton(
////                              icon: Icon(Icons.remove_red_eye),
////                              onPressed: (){
////                                setState(() {
////                                  hideConfirmPass = false;
////                                });
////                              },
////                            ),
////                          ),
////                        ),
////                      ),
////                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                          borderRadius: BorderRadius.circular(24.0),
//                          color: Colors.blue.withOpacity(0.8),
//                          elevation: 0.0,
//                          child: MaterialButton(
//                            onPressed: (){
//                              validateForm();
//                            },
//                            minWidth: MediaQuery.of(context).size.width,
//                            child: Text(
//                              "Sign Up",
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 22.0,
//                              ),
//                            ),
//                          )
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: InkWell(
//                        onTap: (){
//                          Navigator.pop(context);
//                        },
//                        child: Text(
//                          "Already have an account? Click Here to Login",
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
//
//  }
//  valueChanged(e){
//    setState(() {
//      if (e == "Male"){
//        groupValue = e;
//        gender = e;
//      } else if (e == "Female"){
//        groupValue = e;
//        gender = e;
//      }
//    });
//  }
//
//  Future validateForm() async {
//    FormState formState = _formKey.currentState;
//    Map value;
//    if (formState.validate()){
//      formState.reset();
//      FirebaseUser user = await auth.currentUser();
//      if (user == null){
//        auth.createUserWithEmailAndPassword(
//            email: _email.text,
//            password: _password.text)
//            .then((user) => {
//              userServices.createUser(
//                {
//                  "username": _nameTextController.text,
//                  "email": _email.text,
//                  "userId": user.uid
//                }
//              )
//        }).catchError((err) => {print (err.toString())});
//        Navigator.pushReplacement(
//            context, MaterialPageRoute(builder: (context) => HomePage()));
//      }
//    }
//  }
//}
import 'package:alanfalproject/helpers/common.dart';
import 'package:alanfalproject/helpers/style.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:alanfalproject/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/pages/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating ? Loading() : Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[350],
                    blurRadius:
                    20.0, // has the effect of softening the shadow
                  )
                ],
              ),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              'images/logo.png',
                              width: 260.0,
                            )),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.3),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _name,
                                decoration: InputDecoration(
                                    hintText: "Full name",
                                    icon: Icon(Icons.person_outline),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    icon: Icon(Icons.alternate_email),
                                    border: InputBorder.none),
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
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.3),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _password,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = !hidePass;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () async{
                                if(_formKey.currentState.validate()){
                                  if(!await user.signUp(_name.text ,_email.text, _password.text)){
                                    _key.currentState.showSnackBar(SnackBar(content: Text("Sign up failed")));
                                    return;
                                  }
                                  changeScreenReplacement(context, Home());
                                }
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Sign up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "I already have an account",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ))),


                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

}