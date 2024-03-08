import 'package:flutter/material.dart';
import 'package:alanfalproject/models/safewindow.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:alanfalproject/providers/app_provider.dart';
import 'package:alanfalproject/widgets/loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alanfalproject/services/locktype.dart';
import 'package:alanfalproject/models/locktype.dart';
import 'package:alanfalproject/services/size.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alanfalproject/pages/rollingshutter_details.dart';
import 'package:alanfalproject/pages/login.dart';
import 'package:readmore/readmore.dart';

class RollingShutter extends StatefulWidget {

//  final SafeWindow product;
//  final LockType locktype;
  const RollingShutter({Key key,}) : super(key: key);

  @override
  _RollingShutterState createState() => _RollingShutterState();

}

class _RollingShutterState extends State<RollingShutter> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
//  final _key = GlobalKey<ScaffoldState>();
//  String _color = "";
//  String _size = "";
//  TextEditingController widthController = TextEditingController();
//  List<DocumentSnapshot> locktypes = <DocumentSnapshot>[];
//  List<DocumentSnapshot> lockPrice = <DocumentSnapshot>[];
//  List<DocumentSnapshot> sizename = <DocumentSnapshot>[];
//  List<DocumentSnapshot> sizeprice = <DocumentSnapshot>[];
//  List<String> locktypesList = ['Euro Profile Cylinder Lock', 'Self Closing Electromechanical Lock'];
//  List<String> sizeList = ['80', '85', '90', '100'];
//  List<double> heightList = [220,240];
//  double currentwidthprice = 0.0;
//  double currentsizeprice = 0.0;
//  GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
////  LockTypeService lockTypeService = LockTypeService();
//  SizeService sizeService = SizeService();
////  List<DropdownMenuItem<String>> lockTypesDropDown =
////  <DropdownMenuItem<String>>[];
////  List<DropdownMenuItem<String>> sizesDropDown =
////  <DropdownMenuItem<String>>[];
//  String _currentSize;
//  String _currentLockType;
//  double _currentDalfa;
//  double totalProductPrice = 0.00;
//  @override
//  void initState() {
//    super.initState();
//    getLocks();
////    getSizes();
//    totalProductPrice = widget.product.price;
//  }
//

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('Rolling Shutter',
        style: GoogleFonts.changa(color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30
        )),

      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "images/car2.png",
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
                  Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Safety Rolling Shutter',
                    style: GoogleFonts.changa(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                  Container(
                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                  color: Colors.black12
                    ),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ReadMoreText(
                          '3×1 SECURITY VENTILATION AND NO INSECTS TBT. Estella is the only shutter that thanks to its male and female '
                              'slats system guarantees better structural for security against lifting up and impact force in additional '
                              'hiding male slats can provide up to a 40% of aeration and light in a smooth and uniform way adding visibility'
                              ' to the outside reduces the electromagnetic radiation and avoids insects to come into your house rolling shutter'
                              ' model ESTELLA composed by extruded aluminum slats alloy  has three different models of slats which goes together '
                              '– tubular profiles of nominal thickness1.1 mm cod 600 called female and a micro-perforated slat cod 605 called male'
                              ' which contains 1.500 holes per lineal meter to allow the pass of light and air connected to each other by sold'
                              ' aluminum alloy code 604 work as interlock hang and helps to increase the reinforcing between slats in shuttering'
                              ' position and significantly decrease .',
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
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                color: Colors.black12
//            ),
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Image.asset(
                            "images/gif/gifshutter.gif",
                            height: 300.0,
                          )
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
                  padding: EdgeInsets.all(7),
                  child: Text('What Do You Get From Our Rolling Shutter?',
                    style: GoogleFonts.changa(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                  Container(
                    color: Colors.white,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ReadMoreText('Natural light \nWith the new male - female slats system added to micro perforation'
                            ' has managed to increase the surface of light also we have the possibility of adding more control '
                            'just by opening or closing the shutter as we need to get more roles light\nVentilation under control\n'
                            'Thanks to the micro perforation the air inlet is divided between the different pores thus '
                            'smoothing the rate of ventilation you no longer need to have the shutter half open\nSee without being '
                            'seen\nThe micro-perforation applied to each male slat allows a wide view of the outside or in detail if '
                            'we focus on slat by slat. The design of the size of perforations distribution and shape gives'
                            ' us the opportunity to see outside without being seen \nAttenuated light\nThe micro perforation'
                            ' system with its rounded shape and distribution breaks the direct light path fading inward '
                            '\nNo  insects \n Despite having greater ventilation surface it has been proved that it prevents the '
                            'passage of insects of all types.',
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
              color: Colors.white,
                    child: Container(
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Image.asset(
                            "images/gif/gifshutter_1.gif",
                            height: 300.0,
                          )
                      ),
                    ),
                  ),
                ]),
            ),
          ),
//          Divider(color: Colors.white,),

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
                  padding: EdgeInsets.all(7),

                  child: Text('Rolling Shutter Safety Test',
                    style: GoogleFonts.changa(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),),

                ),
                  Container(
                    color: Colors.white,
                    child: Container(
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Image.asset(
                            "images/gif/gifshutter_2.gif",
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
                      padding: EdgeInsets.all(7),
                      child: Text('Past Work',
                        style: GoogleFonts.changa(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
//                    Container(
//                      color: Colors.white,
//                      child: Expanded(
//                        child: Padding(
//                          padding: EdgeInsets.all(10),
//                          child: ReadMoreText('Natural light \nWith the new male - female slats system added to micro perforation'
//                              ' has managed to increase the surface of light also we have the possibility of adding more control '
//                              'just by opening or closing the shutter as we need to get more roles light\nVentilation under control\n'
//                              'Thanks to the micro perforation the air inlet is divided between the different pores thus '
//                              'smoothing the rate of ventilation you no longer need to have the shutter half open\nSee without being '
//                              'seen\nThe micro-perforation applied to each male slat allows a wide view of the outside or in detail if '
//                              'we focus on slat by slat. The design of the size of perforations distribution and shape gives'
//                              ' us the opportunity to see outside without being seen \nAttenuated light\nThe micro perforation'
//                              ' system with its rounded shape and distribution breaks the direct light path fading inward '
//                              '\nNo  insects \n Despite having greater ventilation surface it has been proved that it prevents the '
//                              'passage of insects of all types.',
//                            trimLines: 3,
//                            colorClickableText: Colors.deepOrange,
//                            trimMode: TrimMode.Line,
//                            textAlign: TextAlign.justify,
//                            trimCollapsedText: 'Show more',
//                            trimExpandedText: 'Show less',
//                            style: GoogleFonts.changa(
//                              color: Colors.black,
//                              fontSize: 16,
//                            ),),
//                        ),
//                      ),
//                    ),
                    Container(
                      color: Colors.white,
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image.asset(
                              "images/gif/gifshutter_3.gif",
                              height: 300.0,
                            )
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Divider(color: Colors.white,),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Material(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.black,
                elevation: 0.0,
                child: MaterialButton(
                  onPressed: () {
                    switch(user.status){
                      case Status.Unauthenticated:
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
                            MaterialPageRoute(builder: (context) => new RollingShutterDetails()));
                    }},

                  minWidth: MediaQuery.maybeOf(context).size.width,
                  child: appProvider.isLoading
                      ? Loading()
                      : Text(
                    "Order Rolling Shutter",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.changa(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                )),
          ),
        ],
      ),
     );
  }

}
