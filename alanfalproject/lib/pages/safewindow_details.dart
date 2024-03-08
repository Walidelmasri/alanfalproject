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

class SafeWindowDetails extends StatefulWidget {

  final SafeWindow safewindow;
  final LockType locktype;
  const SafeWindowDetails({Key key, this.safewindow, this.locktype}) : super(key: key);

  @override
  _SafeWindowDetailsState createState() => _SafeWindowDetailsState();

}

class _SafeWindowDetailsState extends State<SafeWindowDetails> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _key = GlobalKey<ScaffoldState>();
  String _color = "";
  String _size = "";
  TextEditingController widthController = TextEditingController();
  TextEditingController addNotesController = TextEditingController();
  List<DocumentSnapshot> locktypes = <DocumentSnapshot>[];
  List<DocumentSnapshot> lockPrice = <DocumentSnapshot>[];
  List<DocumentSnapshot> sizename = <DocumentSnapshot>[];
  List<DocumentSnapshot> sizeprice = <DocumentSnapshot>[];
//  List<String> locktypesList = ['Euro Profile Cylinder Lock', 'Self Closing Electromechanical Lock'];
//  List<String> sizeList = ['80', '85', '90', '100'];
  List<double> heightList = [220,240];
  double currentwidthprice = 0.0;
  double currentsizeprice = 0.0;
  String dalfaType = " ";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

//  LockTypeService lockTypeService = LockTypeService();
//  SizeService sizeService = SizeService();
//  List<DropdownMenuItem<String>> lockTypesDropDown =
//  <DropdownMenuItem<String>>[];
//  List<DropdownMenuItem<String>> sizesDropDown =
//  <DropdownMenuItem<String>>[];
  String _currentSize;
  String _currentLockType;
  double _currentDalfa;
  double totalProductPrice = 0.00;
  Color currentColor = Color(0xff443a49);
  Color pickerColor = Color(0xff443a49);

  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  void changeColor(Color color) => setState(() => currentColor = color);
//  void changeColors(List<Color> colors) => setState(() => currentColors = colors);

  @override
  void initState() {
    super.initState();
//    getLocks();
//    getSizes();
    totalProductPrice = widget.safewindow.price;
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
        title: Text(widget.safewindow.name,
          style: GoogleFonts.changa(fontSize: 30, color: Colors.black,              fontWeight: FontWeight.bold,
          ),),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
            child: Container(
              color: Colors.black.withOpacity(0.9),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.network(
                        widget.safewindow.images[0],
                        height: 450,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),


                    ],
                  ),


                  Expanded(
                    child: Container(
                      color: Colors.white,

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
                                      'Dalfa Height: ',
                                      style: GoogleFonts.changa(color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                  DropdownButton(
                                    items: heightList.map((dalfa) {
                                      return DropdownMenuItem(
                                        child: new Text('$dalfa', style: GoogleFonts.changa(),),
                                        value: dalfa,
                                      );
                                    }).toList(),
                                    onChanged: changeSelectedDalfa,
                                    value: _currentDalfa,
                                    dropdownColor: Colors.white,

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
                                    'Dalfa Width: ',
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
                                      hintStyle: GoogleFonts.changa(),
                                    ),
                                    validator: (value) {
                                      var numValue = int.tryParse(value);
                                      if (value.isEmpty)
                                        return 'You must enter the product name';

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
                                  child: Text('Dalfa Type: ' + dalfaType, style: GoogleFonts.changa(color: Colors.black, fontSize: 18),),
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
                                child: Text(
                                  ('EGP ' + totalProductPrice.toString()),
                                  textAlign: TextAlign.end,style: GoogleFonts.changa(color: Colors.black, fontSize: 18),),

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
                                  onPressed: () async {
                                    var widthNum = int.tryParse(widthController.text);

                                    getDalfaPrice(widthNum, _currentDalfa);
                                    getSizePrice();
                                    if (widthNum == null){
                                      Fluttertoast.showToast(msg: 'Please Enter Dalfa Width Size in CM');
                                    } else if (widthNum > 300) {
                                      Fluttertoast.showToast(msg: 'Maximum Width Allowed is 300 CM');
                                    } else{
                                      totalProductPrice = currentwidthprice + currentsizeprice;
                                      print(currentwidthprice);
                                      print(currentsizeprice);
                                      print(dalfaType);
                                      print(currentColor);
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
                                    bool success = await userProvider.addSafeWindowToCart(
                                      product: widget.safewindow,
                                      color: currentColor.toString(),
                                      windowheight: _currentDalfa.toString(),
                                      windowwidth: widthController.text,
                                      wdalfatype: dalfaType,
                                      totalprice: totalProductPrice + .0,
                                      notes: addNotesController.text
//                                      locktype: _currentLockType,

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
//                    SizedBox(
//                      height: 20,
//                    )
//
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

//  List<DropdownMenuItem<String>> getLockTypesDropdown() {
//    List<DropdownMenuItem<String>> items = new List();
//    for (int i = 0; i < locktypesList.length; i++) {
//      setState(() {
//        items.insert(
//            0,
//            DropdownMenuItem(
//                child: Text(locktypesList[i]),
//                value: locktypesList[i]));
//      });
//    }
//    return items;
//  }
//  List<DropdownMenuItem<String>> getSizesDropdown() {
//    List<DropdownMenuItem<String>> items = new List();
//    for (int i = 0; i < sizename.length; i++) {
//      setState(() {
//        items.insert(
//            0,
//            DropdownMenuItem(
//                child: Text(sizename[i].data['sizeName']),
//                value: sizename[i].data['sizeName']));
//      });
//    }
//    return items;
//  }
  changeSelectedLockType(String selectedLockType) {
    setState(() => _currentLockType = selectedLockType);
//    getDalfaPrice();
//    totalProductPrice = currentlockprice + widget.product.price;

  }
  changeSelectedSize(String selectedSize) {
    setState(() => _currentSize = selectedSize);
//    totalProductPrice = currentlockprice + widget.product.price;

  }

  changeSelectedDalfa(double dalfa) {
    setState(() => _currentDalfa = dalfa);
    getSizePrice();
  }
  getLocks() {
    setState(() {
//      lockTypesDropDown = getLockTypesDropdown();
//      _currentLockType = locktypesList[0];
    });
  }
  //add lock prices
  String getDalfaPrice(int width, double height) {
    setState(() {
      // divide by 100 each
      var area = width/100 * height/100;
      if (width > 200){
        dalfaType = '4 Dalfa';
        currentwidthprice = 4000 * area + 2000;
      } else if (width > 100){
        dalfaType = 'Dalfeten';
        currentwidthprice = 4000 * area + 1000;
      } else {
        dalfaType = 'Dalfa';
        currentwidthprice = 4000 * area;
      }
      return dalfaType;
    });

  }


//  getSizes() {
//    setState(() {
////      sizesDropDown = getSizesDropdown();
////      _currentSize = sizeList[0];
//    });
//  }
  getSizePrice()  {
//    setState(() {
//      if (_currentDalfa == 'Dalfa'){
//        currentsizeprice = widget.product.price * 2;
//
//      }
//      else if (_currentDalfa == 'Dalfa w Telt'){
//        currentsizeprice = widget.product.price * 3;
//        if (_currentLockType == 'Euro Profile Cylinder Lock'){
//          currentwidthprice = 20000;
//        }
//      }
//      else if (_currentDalfa == 'Dalfeten'){
//        currentsizeprice = widget.product.price * 4;
//        if (_currentLockType == 'Euro Profile Cylinder Lock'){
//          currentwidthprice = 25000;
//        }
//      }
//    });
  }

}
