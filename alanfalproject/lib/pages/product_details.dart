import 'package:flutter/material.dart';
import 'package:alanfalproject/models/product.dart';
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
import 'package:transparent_image/transparent_image.dart';
import 'package:alanfalproject/helpers/common.dart';

class ProductDetails extends StatefulWidget {

  final Product product;
  final LockType locktype;
  const ProductDetails({Key key, this.product, this.locktype}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();

}

class _ProductDetailsState extends State<ProductDetails> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _key = GlobalKey<ScaffoldState>();
  String _color = "";
  String _size = "";
  List<DocumentSnapshot> locktypes = <DocumentSnapshot>[];
  List<DocumentSnapshot> lockPrice = <DocumentSnapshot>[];
  List<DocumentSnapshot> sizename = <DocumentSnapshot>[];
  List<DocumentSnapshot> sizeprice = <DocumentSnapshot>[];
  List<String> locktypesList = ['Euro Profile Cylinder Lock', 'Self Closing Electromechanical Lock'];
  List<String> sizeList = ['80', '85', '90', '100'];
  List<String> dalfaList = ['Dalfa', 'Dalfa w Telt', 'Dalfeten'];
  List<String> colorList = ['A1', 'A2', 'A3'];
  List<String> dirList = ['Left', 'Right'];
  double currentlockprice = 0.0;
  double currentsizeprice = 0.0;
//  LockTypeService lockTypeService = LockTypeService();
//  SizeService sizeService = SizeService();
  TextEditingController addNotesController = TextEditingController();
  String _currentSize;
  String _currentLockType;
  String _currentDalfa;
  String _currentColor;
  double totalProductPrice = 0.00;
  Color currentColor = Color(0xff443a49);
  Color pickerColor = Color(0xff443a49);

  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  void changeColor(Color color) => setState(() => currentColor = color);
  @override
  void initState() {
    super.initState();
    getLocks();
//    getSizes();
    totalProductPrice = widget.product.price;
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
        title: Text(widget.product.name,
            style: GoogleFonts.changa(fontSize: 30, color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.black.withOpacity(0.9),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    changeScreen(context, DetailScreen(product: widget.product,));
                  },
                  child: Image.network(
                    widget.product.images[0],
                    height: 450,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),



              ],
            ),


            Expanded(
//              height: 260,

              child: Container(
                color: Colors.white,
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
//                    boxShadow: [
//                      BoxShadow(
//                          color: Colors.white,
//                          offset: Offset(2, 5),
//                          blurRadius: 10
//                      )
//                    ]
//                ),
                child: ListView(
                  children: <Widget>[Container(
                    child: Column(
                      children: <Widget>[
                        //              select category
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
                                    'LockType: ',
                                    style: GoogleFonts.changa(fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                DropdownButton(
                                  items: locktypesList.map((locktype) {
                                    return DropdownMenuItem(
                                      child: new Text(locktype, style: GoogleFonts.changa(fontSize: 18),),
                                      value: locktype,
                                    );
                                  }).toList(),
                                  onChanged: changeSelectedLockType,
                                  value: _currentLockType,
                                  dropdownColor: Colors.white,
                                  hint: Text('Select LockType'),

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
                                    'Number Of Dolaf: ',
                                    style: GoogleFonts.changa(fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                DropdownButton(
                                  items: dalfaList.map((dalfa) {
                                    return DropdownMenuItem(
                                      child: new Text(dalfa, style: GoogleFonts.changa(fontSize: 18),),
                                      value: dalfa,
                                    );
                                  }).toList(),
                                  onChanged: changeSelectedDalfa,
                                  value: _currentDalfa,
                                  dropdownColor: Colors.white,
                                  hint: Text('Select Dalfa'),

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
                                  'Size: ',
                                  style: GoogleFonts.changa(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Container(

                                child: DropdownButton(
                                  items: sizeList.map((size) {
                                    return DropdownMenuItem(
                                      child: new Text(size, style: GoogleFonts.changa(fontSize: 18),),
                                      value: size,
                                    );
                                  }).toList(),
                                  onChanged: changeSelectedSize,
                                  value: _currentSize,
                                  dropdownColor: Colors.white,
                                  hint: Text('Select Size'),

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
                                child: Text(
                                  'Color: ',
                                  style: GoogleFonts.changa(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Container(

                                child: DropdownButton(
                                  items: colorList.map((color) {
                                    return DropdownMenuItem(
                                      child: new Text(color, style: GoogleFonts.changa(fontSize: 18),),
                                      value: color,
                                    );
                                  }).toList(),
                                  onChanged: changeSelectedColor,
                                  value: _currentColor,
                                  dropdownColor: Colors.white,
                                  hint: Text('Select Color'),

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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(

                                children: <Widget>[Text(
                                  ('Price: EGP ' + totalProductPrice.toString()),
                                  textAlign: TextAlign.center,style: GoogleFonts.changa(fontSize: 18, color: Colors.black),),
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
                          padding: const EdgeInsets.all(5),
                          child: Material(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.black,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () async {
//                              appProvider.changeIsLoading();
                                  getLockPrice();
                                  getSizePrice();
                                  if (currentlockprice == 0){
                                    Fluttertoast.showToast(msg: 'Please select a locktype');
                                  } else {
                                    totalProductPrice = currentlockprice + currentsizeprice;
                                    print(currentlockprice);
                                    print(_currentLockType);
                                    print(currentsizeprice);
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
                                  bool success = await userProvider.addToCart(
                                      product: widget.product,
//                                  color: 'red',
                                      totalprice: totalProductPrice + .0,
                                      locktype: _currentLockType,
                                      doorsize: _currentSize,
                                      color: currentColor.toString(),
                                      dalfa: _currentDalfa,
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
//                    SizedBox(
//                      height: 20,
//                    )

                      ],
                    ),
                  ),
                ]),
              ),
            )

          ],
        ),
      )),
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
    getLockPrice();
//    totalProductPrice = currentlockprice + widget.product.price;

  }
  changeSelectedSize(String selectedSize) {
    setState(() => _currentSize = selectedSize);
//    totalProductPrice = currentlockprice + widget.product.price;

  }
  changeSelectedColor(String selectedColor) {
    setState(() => _currentColor = selectedColor);
//    totalProductPrice = currentlockprice + widget.product.price;

  }
  changeSelectedDalfa(String dalfa) {
    setState(() => _currentDalfa = dalfa);
    getSizePrice();
//    totalProductPrice = currentlockprice + widget.product.price;
    if (dalfa == 'Dalfa'){
//      change the size list per dalfa
      sizeList = ['80', '90', '100'];
      _currentSize = '80';
    }
    if (dalfa == 'Dalfa w Telt'){
      sizeList = ['120', '140', '160'];
      _currentSize = '120';
    }
    if (dalfa == 'Dalfeten'){
      sizeList = ['180', '200'];
      _currentSize = '180';

    }

  }
  getLocks() {
    setState(() {
//      lockTypesDropDown = getLockTypesDropdown();
//      _currentLockType = locktypesList[0];
    });
  }
  //add lock prices
  getLockPrice() {
    setState(() {
      if (_currentLockType == 'Euro Profile Cylinder Lock'){
        currentlockprice = 12000;
      } else if (_currentLockType == 'Self Closing Electromechanical Lock'){
        currentlockprice = 22000;
      }
    });

  }
//  getSizes() {
//    setState(() {
////      sizesDropDown = getSizesDropdown();
////      _currentSize = sizeList[0];
//    });
//  }
  getSizePrice() async {
    setState(() {
      if (_currentDalfa == 'Dalfa'){
        currentsizeprice = widget.product.price * 2;
        if (_currentLockType == 'Euro Profile Cylinder Lock'){
          currentlockprice = 12000;
        }
        else if (_currentLockType == 'Self Closing Electromechanical Lock'){
          currentlockprice = 12000 + 10000.0;
        }
      }
      else if (_currentDalfa == 'Dalfa w Telt'){
        currentsizeprice = widget.product.price * 3;
        if (_currentLockType == 'Euro Profile Cylinder Lock'){
          currentlockprice = 20000;
        } else if (_currentLockType == 'Self Closing Electromechanical Lock'){
          currentlockprice = 20000 + 10000.0;
        }
      }
      else if (_currentDalfa == 'Dalfeten'){
        currentsizeprice = widget.product.price * 4;
        if (_currentLockType == 'Euro Profile Cylinder Lock'){
          currentlockprice = 25000;
        } else if (_currentLockType == 'Self Closing Electromechanical Lock'){
          currentlockprice = 25000 + 10000.0;
        }
      }
    });
  }

}
class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: FadeInImage.memoryNetwork(
              image: '${product.images[0]}',
              placeholder: kTransparentImage,
//              errorWidget: new Icon(Icons.error),
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}