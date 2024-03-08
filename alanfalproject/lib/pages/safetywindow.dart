import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alanfalproject/widgets/safewindow_card.dart';
import 'package:alanfalproject/providers/safewindow_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class SafetyWindow extends StatefulWidget {
  @override
  _SafetyWindowState createState() => _SafetyWindowState();
}

class _SafetyWindowState extends State<SafetyWindow> {
  @override
  Widget build(BuildContext context) {

    SafeWindowProvider safeWindowProvider = Provider.of<SafeWindowProvider>(context);

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Safety Window',
          style: GoogleFonts.changa(color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),

      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 230,
              width: MediaQuery.maybeOf(context).size.width,
              child: Image.asset(
                "images/car1.png",
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            Divider(color: Colors.transparent,),
            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: Colors.white,
//              color: Colors.black12,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Defend Your House',
                        style: GoogleFonts.changa(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold
                        ),),
                  ),
                    ),
                    Container(
                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                  color: Colors.white
                      ),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ReadMoreText('Leaf:\n'
                              'A steel core made of a double steel plate with internal vertical reinforcements our materials are chosen and treated to have a timely resistance against the weather conditions.'
                              '\nFrame / counter frame:\n'
                              'Is firmly anchored to the wall on the three sides by means of steel adjustable frame / counter frame system which allows a quick and easy installation .'
                              '\nLock:\n'
                              'Cylinder lock represents a further guarantee of handiness and reliability.'
                              'The lock and the locking mechanisms of the leafs operate irreversibly the mobile bolts.'
                              '\nHinges:\n'
                              'They are made of very stiffen steel and they rotate onto spheres.'
                              'In addition they are equipped with an adjustable mechanism on the three axes thus ensuring a good and quick set up of the leaves.',
                            trimLines: 3,
                            colorClickableText: Colors.deepOrange,
                            trimMode: TrimMode.Line,
                            textAlign: TextAlign.justify,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            style: GoogleFonts.changa(
                              color: Colors.black,
                              fontSize: 18,
                            ),),
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
                              "images/gif/gifsafewindow.gif",
                              height: 300.0,
                            )
                        ),
                      ),
                    ),
                ]),
              ),
            ),
            Divider(color: Colors.white,),

            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: Colors.white,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Past Work',
                      style: GoogleFonts.changa(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                      ),),
                  ),

                    Container(
              color: Colors.white,
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image.asset(
                              "images/gif/gifsafewindow_1.gif",
                              height: 300.0,
                            )
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image.asset(
                              "images/gif/gifsafewindow_2.gif",
                              height: 300.0,
                            )
                        ),
                      ),
                    ),
                ]),
              ),
            ),
            Divider(color: Colors.white,),



            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: new Text('Window Designs',
                      style: GoogleFonts.changa(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),

                  ),
                ),
              ],
            ),

            Container(
              child: Column(
                children: safeWindowProvider.products
                    .map((window) => GestureDetector(
                  child: SafeWindowCard(
                    safewindow: window,
                  ),
                ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
