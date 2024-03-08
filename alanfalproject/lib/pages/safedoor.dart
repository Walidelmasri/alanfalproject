import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alanfalproject/widgets/product_card.dart';
import 'package:alanfalproject/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:alanfalproject/pages/doordesigns.dart';
import 'package:readmore/readmore.dart';
import 'package:alanfalproject/pages/login.dart';
class SafetyDoor extends StatefulWidget {
  @override
  _SafetyDoorState createState() => _SafetyDoorState();
}

class _SafetyDoorState extends State<SafetyDoor> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Safety Doors',
          style: GoogleFonts.changa(color: Colors.black,              fontWeight: FontWeight.bold,
          fontSize: 30
          ),


        ),

      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "images/car3.png",
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
                          child: Text('Can the door be broken into?',
                            style: GoogleFonts.changa(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                      ),
//                      Container(
//                        decoration: BoxDecoration(
////                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                            color: Colors.white
//                        ),
//                        child: Container(
//                          child: Padding(
//                            padding: EdgeInsets.all(10),
//                            child: ReadMoreText('Leaf:\n'
//                                'A steel core made of a double steel plate with internal vertical reinforcements our materials are chosen and treated to have a timely resistance against the weather conditions.'
//                                '\nFrame / counter frame:\n'
//                                'Is firmly anchored to the wall on the three sides by means of steel adjustable frame / counter frame system which allows a quick and easy installation .'
//                                '\nLock:\n'
//                                'Cylinder lock represents a further guarantee of handiness and reliability.'
//                                'The lock and the locking mechanisms of the leafs operate irreversibly the mobile bolts.'
//                                '\nHinges:\n'
//                                'They are made of very stiffen steel and they rotate onto spheres.'
//                                'In addition they are equipped with an adjustable mechanism on the three axes thus ensuring a good and quick set up of the leaves.',
//                              trimLines: 3,
//                              colorClickableText: Colors.deepOrange,
//                              trimMode: TrimMode.Line,
//                              textAlign: TextAlign.justify,
//                              trimCollapsedText: 'Show more',
//                              trimExpandedText: 'Show less',
//                              style: GoogleFonts.changa(
//                                color: Colors.black,
//                                fontSize: 16,
//                              ),),
//                          ),
//                        ),
//                      ),
                      Container(
                        decoration: BoxDecoration(
//                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                            color: Colors.white
                        ),
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                "images/gif/gifsafedoor.gif",
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
                            child: ReadMoreText(
                              'Certification & performance'
                             ' Home has to be the most safe and comfortable place.'

                              'VIGHI door now opens new doors to a special way of life by perfectly'
                                 ' combining safety with aesthetics which can be adapted to any design need'

                              'The automated production ensures the guaranteed quality of its products and in '
                                 'conjunction with human resources.'

                              'VIGHI security doors are committed to the continuous improvement of manufacturing'
                                 ' process the company is certified according to uni en iso 2008-9001 norms for '
                                 'company’s quality management system'

                              '22Laboratory tests have been acted to measure performance of'
                                 ' eachdoor model according to European standards and norms.'

                              'UNI 9723'
                              '11 Approval granted on the basis of compliance to strict standards of resistance '
                                 'to fire the doors undergo the attack of fire reproduced in a special  '
                                 'kiln during which their behavior is carefully tested.'

                              'REI 30, 60, 90,120 standards indicates the product capability to preserve'
                                 ' its features in the presence of fire and its stability for set times in '
                                 'additional to block flames smoke and transmission of heat.'

                              'R stability capability to preserve the mechanical resistance.'

                              'E seal capability of preventing the passage of or producing smoke or flames.'

                              'I thermal insulation capability of reducing the transmission of heat.',
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
                                "images/gif/gifsafedoor1.gif",
                                height: 300.0,
                              )
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
                                "images/gif/gifsafedoor2.gif",
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
//              color: Colors.black12,
              child: Container(
                child: Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Door Specifications',
                            style: GoogleFonts.changa(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                      ),
//                      Container(
//                        decoration: BoxDecoration(
////                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                            color: Colors.white
//                        ),
//                        child: Container(
//                          child: Padding(
//                            padding: EdgeInsets.all(10),
//                            child: ReadMoreText('Leaf:\n'
//                                'A steel core made of a double steel plate with internal vertical reinforcements our materials are chosen and treated to have a timely resistance against the weather conditions.'
//                                '\nFrame / counter frame:\n'
//                                'Is firmly anchored to the wall on the three sides by means of steel adjustable frame / counter frame system which allows a quick and easy installation .'
//                                '\nLock:\n'
//                                'Cylinder lock represents a further guarantee of handiness and reliability.'
//                                'The lock and the locking mechanisms of the leafs operate irreversibly the mobile bolts.'
//                                '\nHinges:\n'
//                                'They are made of very stiffen steel and they rotate onto spheres.'
//                                'In addition they are equipped with an adjustable mechanism on the three axes thus ensuring a good and quick set up of the leaves.',
//                              trimLines: 3,
//                              colorClickableText: Colors.deepOrange,
//                              trimMode: TrimMode.Line,
//                              textAlign: TextAlign.justify,
//                              trimCollapsedText: 'Show more',
//                              trimExpandedText: 'Show less',
//                              style: GoogleFonts.changa(
//                                color: Colors.black,
//                                fontSize: 16,
//                              ),),
//                          ),
//                        ),
//                      ),
                      Container(
                        decoration: BoxDecoration(
//                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                            color: Colors.white
                        ),
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                "images/gif/gifsafedoor3.gif",
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
//              color: Colors.black12,
              child: Container(
                child: Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Different Door Designs',
                            style: GoogleFonts.changa(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                      ),
//                      Container(
//                        decoration: BoxDecoration(
////                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                            color: Colors.white
//                        ),
//                        child: Container(
//                          child: Padding(
//                            padding: EdgeInsets.all(10),
//                            child: ReadMoreText('Leaf:\n'
//                                'A steel core made of a double steel plate with internal vertical reinforcements our materials are chosen and treated to have a timely resistance against the weather conditions.'
//                                '\nFrame / counter frame:\n'
//                                'Is firmly anchored to the wall on the three sides by means of steel adjustable frame / counter frame system which allows a quick and easy installation .'
//                                '\nLock:\n'
//                                'Cylinder lock represents a further guarantee of handiness and reliability.'
//                                'The lock and the locking mechanisms of the leafs operate irreversibly the mobile bolts.'
//                                '\nHinges:\n'
//                                'They are made of very stiffen steel and they rotate onto spheres.'
//                                'In addition they are equipped with an adjustable mechanism on the three axes thus ensuring a good and quick set up of the leaves.',
//                              trimLines: 3,
//                              colorClickableText: Colors.deepOrange,
//                              trimMode: TrimMode.Line,
//                              textAlign: TextAlign.justify,
//                              trimCollapsedText: 'Show more',
//                              trimExpandedText: 'Show less',
//                              style: GoogleFonts.changa(
//                                color: Colors.black,
//                                fontSize: 16,
//                              ),),
//                          ),
//                        ),
//                      ),
                      Container(
                        decoration: BoxDecoration(
//                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                            color: Colors.white
                        ),
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                "images/gif/gifsafedoor7.gif",
                                height: 300.0,
                              )
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
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
                          child: Text('6 Installation Steps',
                            style: GoogleFonts.changa(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                      ),
//                      Container(
//                        decoration: BoxDecoration(
////                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                            color: Colors.white
//                        ),
//                        child: Container(
//                          child: Padding(
//                            padding: EdgeInsets.all(10),
//                            child: ReadMoreText('Leaf:\n'
//                                'A steel core made of a double steel plate with internal vertical reinforcements our materials are chosen and treated to have a timely resistance against the weather conditions.'
//                                '\nFrame / counter frame:\n'
//                                'Is firmly anchored to the wall on the three sides by means of steel adjustable frame / counter frame system which allows a quick and easy installation .'
//                                '\nLock:\n'
//                                'Cylinder lock represents a further guarantee of handiness and reliability.'
//                                'The lock and the locking mechanisms of the leafs operate irreversibly the mobile bolts.'
//                                '\nHinges:\n'
//                                'They are made of very stiffen steel and they rotate onto spheres.'
//                                'In addition they are equipped with an adjustable mechanism on the three axes thus ensuring a good and quick set up of the leaves.',
//                              trimLines: 3,
//                              colorClickableText: Colors.deepOrange,
//                              trimMode: TrimMode.Line,
//                              textAlign: TextAlign.justify,
//                              trimCollapsedText: 'Show more',
//                              trimExpandedText: 'Show less',
//                              style: GoogleFonts.changa(
//                                color: Colors.black,
//                                fontSize: 16,
//                              ),),
//                          ),
//                        ),
//                      ),
                      Container(
                        decoration: BoxDecoration(
//                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                            color: Colors.white
                        ),
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                "images/gif/gifsafedoor4.gif",
                                height: 300.0,
                              )
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
                                "images/gif/gifsafedoor5.gif",
                                height: 300.0,
                              )
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
                                "images/gif/gifsafedoor6.gif",
                                height: 300.0,
                              )
                          ),
                        ),
                      ),
                    ]),
              ),
            ),


//            Row(
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.all(14.0),
//                  child: Container(
//                    alignment: Alignment.centerLeft,
//                    child: new Text('Door Designs',
//                      style: GoogleFonts.cinzel(
//                          fontSize: 20,
//                          color: Colors.black,
//                          fontWeight: FontWeight.bold
//                      ),),
//
//                  ),
//                ),
//              ],
//            ),
          SizedBox(height: 20,),
            Material(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.black,
                elevation: 0.0,
                child: MaterialButton(
                  onPressed: () {
                    switch(user.status){
                      case Status.Unauthenticated: showDialog(
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
                                    'Please Sign In in order to continue',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 320.0,
                                    child: RaisedButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => new Login()));                },
                                        child: Text(
                                          "Sign In",
                                          style: GoogleFonts.changa(
                                              color: Colors.white,
                                          fontSize: 18),
                                        ),
                                        color: Colors.blue),
                                  ),
                                  SizedBox(
                                    width: 320.0,
                                    child: RaisedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Reject",
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
                        );}
                      );
                      break;
                      default:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => new DoorDesigns()));
                        break;
                    }
                  },

                  minWidth: MediaQuery.of(context).size.width,
                  child: Text(
                    "Select Your Door Design",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.changa(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
