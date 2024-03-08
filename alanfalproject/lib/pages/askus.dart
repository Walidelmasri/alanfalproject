import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:alanfalproject/services/enquiry.dart';

class AskUs extends StatefulWidget {
  @override
  _AskUsState createState() => _AskUsState();
}

class _AskUsState extends State<AskUs> {
  final _askusForm = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _enquiry = TextEditingController();
  EnquiryServices enquiryServices = EnquiryServices();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Enquiry',
          style: GoogleFonts.changa(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),


        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(FontAwesomeIcons.phoneSquare, color: Colors.deepOrange), onPressed: () {
            launch('tel:00201010010052');
//                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
          }),

        ],
      ),
      body: Container(
        child:
            Form(
              key: _askusForm,
              child: ListView(
                  children: <Widget>[
                    Container(
                      height: 180,
                      width: MediaQuery.maybeOf(context).size.width,

                      child: Image.asset(
                        "images/logo.png",
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: TextFormField(
                            controller: _name,
                            decoration: InputDecoration(
                                hintText: "Please Enter Your Name",
                                icon: Icon(Icons.person_outline),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Name field must not be Empty";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: TextFormField(
                            controller: _phonenumber,
                            decoration: InputDecoration(
                                hintText: "Please Enter Your Phone Number",
                                icon: Icon(Icons.person_outline),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The Phone Number field must not be Empty";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: TextFormField(
                            controller: _enquiry,
                            decoration: InputDecoration(
                                hintText: "Please Enter Your Enquiry",
                                icon: Icon(Icons.person_outline),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The Enquiry field must not be Empty";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),

                      child: RaisedButton(
                        textColor: Colors.black,
                        child: Text('Submit Enquiry', style: GoogleFonts.changa(
                          fontSize: 28
                        ),),
                        color: Colors.deepOrange,
                        onPressed: () async {
                          var uuid = Uuid();
                          String id = uuid.v4();
                          await enquiryServices.createEnquiry(
                            name: _name.text,
                            phonenumber: _phonenumber.text,
                            id: id,
                            enquiry: _enquiry.text
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
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
                                          'Your Enquiry Has Been Sent! One of our Employees will reply to you shortly',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 320.0,
                                          child: RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Ok",
                                                style: GoogleFonts.changa(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          );
                        },
                      ),
                    )

                  ]
              ),
        ),
      ),
    );
  }
}
