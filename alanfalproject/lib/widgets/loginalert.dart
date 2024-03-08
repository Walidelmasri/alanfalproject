import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alanfalproject/pages/login.dart';

class LoginAlert extends StatefulWidget {
  @override
  _LoginAlertState createState() => _LoginAlertState();
}

class _LoginAlertState extends State<LoginAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      //this right here
      child: Container(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'Please Sign In in order to continue',
                textAlign: TextAlign.center,
                style: GoogleFonts.cinzel(fontWeight: FontWeight.bold, fontSize: 15),
              ),
          SizedBox(
            width: 320.0,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Login()));                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.blue),
                ),
                color: Colors.red),
          ),
              SizedBox(
                width: 320.0,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Reject",
                      style: TextStyle(
                          color: Colors.white),
                    ),
                    color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
