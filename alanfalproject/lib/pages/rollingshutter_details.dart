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
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class RollingShutterDetails extends StatefulWidget {

//  final SafeWindow product;
//  final LockType locktype;
  const RollingShutterDetails({Key key,}) : super(key: key);

  @override
  _RollingShutterDetailsState createState() => _RollingShutterDetailsState();

}

class _RollingShutterDetailsState extends State<RollingShutterDetails> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _key = GlobalKey<ScaffoldState>();
  String _color = "";
  String _size = "";
  TextEditingController widthController = TextEditingController();
  TextEditingController addNotesController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  List<DocumentSnapshot> locktypes = <DocumentSnapshot>[];
  List<DocumentSnapshot> lockPrice = <DocumentSnapshot>[];
  List<DocumentSnapshot> sizename = <DocumentSnapshot>[];
  List<DocumentSnapshot> sizeprice = <DocumentSnapshot>[];
//  List<String> locktypesList = ['Euro Profile Cylinder Lock', 'Self Closing Electromechanical Lock'];
//  List<String> sizeList = ['80', '85', '90', '100'];
//  List<double> heightList = [220,240];
//  double currentwidthprice = 0.0;
//  double currentsizeprice = 0.0;
  GlobalKey<FormState> secondFormKey = GlobalKey<FormState>();
  String motorType = "  ";
//  LockTypeService lockTypeService = LockTypeService();
//  SizeService sizeService = SizeService();
//  List<DropdownMenuItem<String>> lockTypesDropDown =
//  <DropdownMenuItem<String>>[];
//  List<DropdownMenuItem<String>> sizesDropDown =
//  <DropdownMenuItem<String>>[];
//  String _currentSize;
//  String _currentLockType;
//  double _currentDalfa;
  double totalProductPrice;
  double motorPrice;
  double totalPrice;
  double areaPrice;

  @override
  void initState() {
    super.initState();
    totalProductPrice = 0.00;
  }


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('Rolling Shutter',
          style: GoogleFonts.changa(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: (){}
          ),
        ],
      ),
      body: Form(
        key: secondFormKey,
        child: SafeArea(
            child: Container(
              color: Colors.black.withOpacity(0.9),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.network(
                        "gs://alanfal-cebf5.appspot.com/rollingshutter.jpg",
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

//                      Align(
//                        alignment: Alignment.topCenter,
//                        child: Container(
//                            height: 100,
//                            decoration: BoxDecoration(
//                              // Box decoration takes a gradient
//                              gradient: LinearGradient(
//                                // Where the linear gradient begins and ends
//                                begin: Alignment.topCenter,
//                                end: Alignment.bottomCenter,
//                                // Add one stop for each color. Stops should increase from 0 to 1
//                                colors: [
//                                  // Colors are easy thanks to Flutter's Colors class.
//                                  Colors.black.withOpacity(0.7),
//                                  Colors.black.withOpacity(0.5),
//                                  Colors.black.withOpacity(0.07),
//                                  Colors.black.withOpacity(0.05),
//                                  Colors.black.withOpacity(0.025),
//                                ],
//                              ),
//                            ),
//
//                            child: Padding(
//                                padding: const EdgeInsets.only(top: 8.0),
//                                child: Container()
//                            )),
//                      ),

//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
////                    Padding(
////                        padding: const EdgeInsets.all(4.0),
////                        child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: (){
////                          Navigator.pop(context);
////                        })
////                    ),
////
////
////                    Row(
////                      children: <Widget>[
////                        Padding(
////                            padding: const EdgeInsets.all(4),
////                            child: Card(
////                              elevation: 10,
////                              shape: RoundedRectangleBorder(
////                                  borderRadius: BorderRadius.circular(20)
////                              ),
////                              child: Padding(
////                                padding: const EdgeInsets.all(8.0),
////                                child: Icon(Icons.shopping_cart),
////                              ),
////                            )
////                        ),
////
////                        Padding(
////                            padding: const EdgeInsets.all(4),
////                            child: Card(
////                              elevation: 10,
////                              shape: RoundedRectangleBorder(
////                                  borderRadius: BorderRadius.circular(20)
////                              ),
////                              child: Padding(
////                                padding: const EdgeInsets.all(8.0),
////                                child: Icon(Icons.favorite_border),
////                              ),
////                            )
////                        ),
////
////                      ],
////                    ),
//
//
//                        ],
//                      ),

//                      Align(
//                        alignment: Alignment.bottomCenter,
//                        child: Container(
//                            height: 400,
//                            decoration: BoxDecoration(
//                              // Box decoration takes a gradient
//                              gradient: LinearGradient(
//                                // Where the linear gradient begins and ends
//                                begin: Alignment.bottomCenter,
//                                end: Alignment.topCenter,
//                                // Add one stop for each color. Stops should increase from 0 to 1
//                                colors: [
//                                  // Colors are easy thanks to Flutter's Colors class.
//                                  Colors.black.withOpacity(0.8),
//                                  Colors.black.withOpacity(0.6),
//                                  Colors.black.withOpacity(0.6),
//                                  Colors.black.withOpacity(0.4),
//                                  Colors.black.withOpacity(0.07),
//                                  Colors.black.withOpacity(0.05),
//                                  Colors.black.withOpacity(0.025),
//                                ],
//                              ),
//                            ),
//
//                            child: Padding(
//                                padding: const EdgeInsets.only(top: 8.0),
//                                child: Container()
//                            )),
//                      ),
//                      Positioned(
//                          bottom: 0,
//                          child: Container(
//                            width: MediaQuery.of(context).size.width,
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: <Widget>[
//                                Padding(
//                                  padding: const EdgeInsets.all(10.0),
//                                  child: Text(
//                                    'Rolling Shutter',
//                                    style: GoogleFonts.pacifico(fontSize: 25, color: Colors.deepOrange),),
//                                ),
//
//
//                              ],
//                            ),
//                          )),

                    ],
                  ),


                  Expanded(
                    child: Container(
                      color: Colors.white,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
//                          boxShadow: [
//                            BoxShadow(
//                                color: Colors.white,
//                                offset: Offset(2, 5),
//                                blurRadius: 10
//                            )
//                          ]
//                      ),
                      child: ListView(
                        children: <Widget>[
//
                          Card(
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 5.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: Colors.white70,
                            child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Rolling Shutter Height: ',
                                      style: GoogleFonts.changa(color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 150,
                                      child: TextFormField(
                                        controller: heightController,
                                        keyboardType: TextInputType.numberWithOptions(signed: true),
                                        decoration: InputDecoration(
                                          hintText: 'Height in CM',
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty)
                                            return 'You must enter the height';

                                        },
                                      ),
                                    ),
                                  ),
//                                DropdownButton(
//                                  items: heightList.map((dalfa) {
//                                    return DropdownMenuItem(
//                                      child: new Text('$dalfa', style: GoogleFonts.pacifico(fontSize: 10),),
//                                      value: dalfa,
//                                    );
//                                  }).toList(),
//                                  onChanged: changeSelectedDalfa,
//                                  value: _currentDalfa,
//                                  dropdownColor: Colors.deepOrange,
//
//                                ),

                                ]),
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
                            color: Colors.white70,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Rolling Shutter Width: ',
                                    style: GoogleFonts.changa(color: Colors.black, fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 150,
                                    child: TextFormField(
                                      controller: widthController,
                                      keyboardType: TextInputType.numberWithOptions(signed: true),
                                      decoration: InputDecoration(
                                        hintText: 'Width in CM',
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'You must enter the width';

                                      },
                                    ),
                                  ),
                                ),
                              ],
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
                            color: Colors.white70,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Motor Type: ' + motorType, style: GoogleFonts.changa(color: Colors.black, fontSize: 18),),
                                ),
                              ],
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
                            color: Colors.white70,
                            child: Row(
                                children: <Widget>[
                                  Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    ('EGP ' + totalProductPrice.toStringAsFixed(2)),
                                    textAlign: TextAlign.center,style: GoogleFonts.changa(color: Colors.black, fontSize: 18),),

                                ),
                                ]),
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
                            color: Colors.white70,
                            child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Additional Notes: ',
                                      style: GoogleFonts.changa(color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 150,
                                      child: TextFormField(
                                        controller: addNotesController,
                                        keyboardType: TextInputType.numberWithOptions(signed: true),
                                        decoration: InputDecoration(
                                          hintText: 'Any Additional Notes You Want To Add',
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Material(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.black,
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    double widthNum = double.tryParse(widthController.text);
                                    double heightNum = double.tryParse(heightController.text);
                                    if (widthNum == null){
                                      Fluttertoast.showToast(msg: 'Please Enter Dalfa Width Size in CM');
                                    } else if (widthNum > 500) {
                                      Fluttertoast.showToast(msg: 'Maximum Width Allowed is 500 CM');
                                    } else if(heightNum == 0 && null){
                                      Fluttertoast.showToast(msg: 'Please Enter Dalfa Height Size in CM');
                                    }
                                    else{
                                      double price = getShutterPrice(widthNum, heightNum);
                                      totalProductPrice = price + .0;
                                      print(totalProductPrice);
//                                      motorType = getMotorType();
                                      print(motorType);
//                                      print(currentColor);
                                    }
                                  },
                                  minWidth: MediaQuery.maybeOf(context).size.width,
                                  child: appProvider.isLoading
                                      ? Loading()
                                      : Text(
                                    "Calculate Price",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.changa(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Material(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.black,
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () async {
                                    appProvider.changeIsLoading();
                                    bool success = await userProvider.addRollingToCart(
                                      imgurl:  "images/rollingshutter.jpg",
                                    rolling: 'Rolling Shutter',
                                      totalprice: totalProductPrice + .0,
                                      windowheight: heightController.text,
                                      windowwidth: widthController.text,
                                      wmotortype: motorType,
                                      notes: addNotesController.text
//                                  size: 'l');
                                    );
                                    if (success) {
                                      Fluttertoast.showToast(msg: 'Product Added to cart');
                                      userProvider.reloadUserModel();
                                      appProvider.changeIsLoading();
                                      Navigator.pop(context);
                                      return;
                                    } else {
                                      Fluttertoast.showToast(msg: 'Product Failed');
                                      appProvider.changeIsLoading();
                                      return;
                                    }
                                  },
                                  minWidth: MediaQuery.maybeOf(context).size.width,
                                  child: appProvider.isLoading
                                      ? Loading()
                                      : Text(
                                    "Add to cart",
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
                    ),
                  )
//
                ],
              ),
            )),
      ),
    );

  }
  String getMotorType(){
    return motorType;
  }

  getShutterPrice(double height, double width){
    double area = (height/100 * width/100);
    areaPrice = area * 4000;
    double motorWeight = area * 13.0;

    if (motorWeight > 80){
      motorPrice = 8000.0;
      motorType = '80 - 120Kg';
    }
    else if (motorWeight > 50){
      motorPrice = 5000.0;
      motorType = '50 - 80Kg';

    }
    else if (motorWeight > 30){
      motorPrice = 3500.0;
      motorType = '30 - 50Kg';

    }
    else{
      motorPrice = 2500.0;
      motorType = '0 - 30Kg';

    }
    totalPrice = areaPrice + motorPrice;
    setState(() {
      totalProductPrice = totalPrice;
      motorType = motorType;
    });
    return totalPrice;

  }

}
