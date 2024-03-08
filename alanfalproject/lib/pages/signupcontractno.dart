import 'package:flutter/material.dart';
import 'package:alanfalproject/helpers/common.dart';
import 'package:alanfalproject/helpers/style.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:alanfalproject/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/pages/login.dart';

class SignUpContract extends StatefulWidget {
  @override
  _SignUpContractState createState() => _SignUpContractState();
}

class _SignUpContractState extends State<SignUpContract> {
  final _formKeyContrat = GlobalKey<FormState>();
  final _keyContract = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _contractNo = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _address = TextEditingController();
  String loginemail;
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _keyContract,
      body: user.status == Status.Authenticating ? Loading() : Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    blurRadius:
                    15.0, // has the effect of softening the shadow
                  )
                ],
              ),
              child: Form(
                  key: _formKeyContrat,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Card(
                        child: Column(
                          children: <Widget>[
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
                                      controller: _contractNo,
                                      decoration: InputDecoration(
                                          hintText: "Contract Number",
                                          icon: Icon(Icons.person_outline),
                                          border: InputBorder.none),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The contract number field cannot be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
//                            Padding(
//                              padding:
//                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                              child: Material(
//                                borderRadius: BorderRadius.circular(10.0),
//                                color: Colors.grey.withOpacity(0.3),
//                                elevation: 0.0,
//                                child: Padding(
//                                  padding: const EdgeInsets.only(left: 12.0),
//                                  child: ListTile(
//                                    title: TextFormField(
//                                      controller: _phonenumber,
//                                      decoration: InputDecoration(
//                                          hintText: "Phone Number",
//                                          icon: Icon(Icons.person_outline),
//                                          border: InputBorder.none),
//                                      validator: (value) {
//                                        if (value.isEmpty) {
//                                          return "The Phone Number field cannot be empty";
//                                        }
//                                        return null;
//                                      },
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            Padding(
//                              padding:
//                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                              child: Material(
//                                borderRadius: BorderRadius.circular(10.0),
//                                color: Colors.grey.withOpacity(0.3),
//                                elevation: 0.0,
//                                child: Padding(
//                                  padding: const EdgeInsets.only(left: 12.0),
//                                  child: ListTile(
//                                    title: TextFormField(
//                                      controller: _address,
//                                      decoration: InputDecoration(
//                                          hintText: "Address",
//                                          icon: Icon(Icons.person_outline),
//                                          border: InputBorder.none),
//                                      validator: (value) {
//                                        if (value.isEmpty) {
//                                          return "The Address field cannot be empty";
//                                        }
//                                        return null;
//                                      },
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            Padding(
//                              padding:
//                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                              child: Material(
//                                borderRadius: BorderRadius.circular(10.0),
//                                color: Colors.grey.withOpacity(0.2),
//                                elevation: 0.0,
//                                child: Padding(
//                                  padding: const EdgeInsets.only(left: 12.0),
//                                  child: ListTile(
//                                    title: TextFormField(
//                                      controller: _email,
//                                      decoration: InputDecoration(
//                                          hintText: "Email",
//                                          icon: Icon(Icons.alternate_email),
//                                          border: InputBorder.none),
//                                      validator: (value) {
//                                        if (value.isEmpty) {
//                                          Pattern pattern =
//                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                                          RegExp regex = new RegExp(pattern);
//                                          if (!regex.hasMatch(value))
//                                            return 'Please make sure your email address is valid';
//                                          else
//                                            return null;
//                                        }
//                                      },
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),

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
                                      loginemail = _contractNo.text+'@door.com';
                                      print (loginemail.trim());
                                      if(_formKeyContrat.currentState.validate()){
                                        if(!await user.signUpwithContract(loginemail,  _password.text, _contractNo.text)){
                                          _keyContract.currentState.showSnackBar(SnackBar(content: Text("Sign Up failed")));
                                          return;
                                        }
                                        _keyContract.currentState.showSnackBar(SnackBar(content: Text('Sign Up Succeeded'),));
                                        changeScreenReplacement(context, Login());
                                      }
                                    },
                                    minWidth: MediaQuery.maybeOf(context).size.width,
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
                        ),
                      ),


                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
