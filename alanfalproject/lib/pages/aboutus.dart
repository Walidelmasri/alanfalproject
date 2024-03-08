import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alanfalproject/pages/contactus.dart';
class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
          'About Us',
          style: GoogleFonts.changa(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),


        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.phone, color: Colors.deepOrange), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
          }),

        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 180,
            width: MediaQuery.maybeOf(context).size.width,
            child: Image.asset(
              "images/logo.png",
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        Card(
      clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '20 Years of Experience',
                      style: GoogleFonts.changa(
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text('One of the qualified companies established in 1998 response to customer '
                    'demand for completely engineered solutions to intricate technical problems.'
                    ' Following early success in such fields as specialized Doors & Windows The Company'
                    ' offer full technical expert personnel to supply, design, install. Al Anfal is '
                    'the sole agent of Gardesa Armoured doors in besides we are the distributor also '
                    'for NINZ fire doors & Mottura sefty locks @ Italy Al Anfal has a well equipment '
                    'workshop for services and maintenance',
                style: GoogleFonts.changa(
                  fontSize: 18
                ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
//                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    color: Colors.white
                ),
                child: Container(
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Image.asset(
                        "images/aboutus/aboutusgif1.gif",
                        height: 300.0,
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}
