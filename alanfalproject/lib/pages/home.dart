import 'package:alanfalproject/pages/askus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:alanfalproject/pages/cart.dart';
import 'package:alanfalproject/helpers/screen_navigation.dart';
import 'package:alanfalproject/pages/login.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:alanfalproject/providers/product_provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:alanfalproject/pages/contactus.dart';
import 'package:alanfalproject/pages/safetywindow.dart';
import 'package:alanfalproject/pages/rollingshutter.dart';
import 'package:alanfalproject/pages/order.dart';
import 'package:alanfalproject/pages/safedoor.dart';
import 'package:alanfalproject/pages/useraccount.dart';
import 'package:alanfalproject/pages/gallery.dart';
import 'package:alanfalproject/pages/aboutus.dart';
import 'lockwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alanfalproject/pages/firedoor';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  final _key = GlobalKey<ScaffoldState>();
//  ProductServices _productServices = ProductServices();
  double _scale;
  double _scale2;
  double _scale3;
  double _scaled1;
//  double _scaled2;
//  double _scaled3;
//  double _scaled4;
//  double _scaled5;
//  double _scaled6;
//  double _scaled7;
//  double _scale3stack;
//  double _scalecart;
  final String fbPageUrl = 'http://fb.me/safetydoor';
  final String instaUrl = 'https://www.instagram.com/anfaldoor/';
  final String youtubeUrl = 'https://www.youtube.com/channel/UC7dXsJgRhJZv0Q7MVryEWmg';

  AnimationController _controller;
  AnimationController _controller2;
  AnimationController _controller3;
  AnimationController _controllerd1;
//  AnimationController _controllerd2;
//  AnimationController _controllerd3;
//  AnimationController _controllerd4;
//  AnimationController _controllerd5;
//  AnimationController _controllerd6;
//  AnimationController _controllerd7;
//  AnimationController _controllercart;
//  AnimationController _controller3stack;


  @override
  void initState(){
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 30,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 30,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 30,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    _controllerd1 = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 30,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
//    _controllerd2 = AnimationController(
//      vsync: this,
//      duration: Duration(
//        milliseconds: 30,
//      ),
//      lowerBound: 0.0,
//      upperBound: 0.1,
//    )..addListener(() {
//      setState(() {});
//    });
//    _controllerd3 = AnimationController(
//      vsync: this,
//      duration: Duration(
//        milliseconds: 30,
//      ),
//      lowerBound: 0.0,
//      upperBound: 0.1,
//    )..addListener(() {
//      setState(() {});
//    });
//    _controllerd4 = AnimationController(
//      vsync: this,
//      duration: Duration(
//        milliseconds: 30,
//      ),
//      lowerBound: 0.0,
//      upperBound: 0.1,
//    )..addListener(() {
//      setState(() {});
//    });
//    _controllerd5 = AnimationController(
//      vsync: this,
//      duration: Duration(
//        milliseconds: 30,
//      ),
//      lowerBound: 0.0,
//      upperBound: 0.1,
//    )..addListener(() {
//      setState(() {});
//    });
//    _controllerd6 = AnimationController(
//      vsync: this,
//      duration: Duration(
//        milliseconds: 30,
//      ),
//      lowerBound: 0.0,
//      upperBound: 0.1,
//    )..addListener(() {
//      setState(() {});
//    });
//    _controllerd7 = AnimationController(
//      vsync: this,
//      duration: Duration(
//        milliseconds: 30,
//      ),
//      lowerBound: 0.0,
//      upperBound: 0.1,
//    )..addListener(() {
//      setState(() {});
//    });
//
//    _controllercart = AnimationController(
//      vsync: this,
//      duration: Duration(
//        milliseconds: 30,
//      ),
//      lowerBound: 0.0,
//      upperBound: 0.1,
//    )..addListener(() {
//      setState(() {});
//    });
//    _controller3stack = AnimationController(
//      vsync: this,
//      duration: Duration(
//        milliseconds: 30,
//      ),
//      lowerBound: 0.0,
//      upperBound: 0.1,
//    )..addListener(() {
//      setState(() {});
//    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
    _controllerd1.dispose();
//    _controllerd2.dispose();
//    _controllerd3.dispose();
//    _controllerd4.dispose();
//    _controllerd5.dispose();
//    _controllerd6.dispose();
//    _controllerd7.dispose();
//    _controller3stack.dispose();
//    _controllercart.dispose();


  }
  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    _scale2 = 1 - _controller2.value;
    _scale3 = 1 - _controller3.value;
//    _scale3stack = 1 - _controller3stack.value;
    _scaled1 = 1 - _controllerd1.value;
//    _scaled2 = 1 - _controllerd2.value;
//    _scaled3 = 1 - _controllerd3.value;
//    _scaled4 = 1 - _controllerd4.value;
//    _scaled5 = 1 - _controllerd5.value;
//    _scaled6 = 1 - _controllerd6.value;
//    _scaled7 = 1 - _controllerd7.value;
//    _scalecart = 1 - _controllercart.value;
//    _scalecall = 1 - _controllercall.value;


//    AppProvider appProvider = Provider.of<AppProvider>(context);
    final user = Provider.of<UserProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
//    SafeWindowProvider safeWindowProvider = Provider.of<SafeWindowProvider>(context);
//    List<Product> productList = [];

//    final auth = Provider.of<AuthProvider>(context);
    Widget image_carousel = new
    Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(50.0),
//        ),
        color: Colors.white,
    child: Container(
      height: 230,
      child: new Carousel(
        boxFit: BoxFit.scaleDown,
        images: [
          AssetImage('images/car1.png'),
          AssetImage('images/car2.png'),
          AssetImage('images/car3.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 3.5,
        indicatorBgPadding: 4.0,
        dotBgColor: Colors.black,
        dotColor: Colors.white,
      ),
    ));
    Widget news_carousel = new
    Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(50.0),
//        ),
        color: Colors.white,
    child: Container(
      height: 180,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: new Carousel(
        boxFit: BoxFit.scaleDown,
        images: [
          AssetImage('images/recentworklogo/1.jpg'),
          AssetImage('images/recentworklogo/2.jpg'),
          AssetImage('images/recentworklogo/3.jpg'),
          AssetImage('images/recentworklogo/4.jpg'),
          AssetImage('images/recentworklogo/5.jpg'),
          AssetImage('images/recentworklogo/6.jpg'),
          AssetImage('images/recentworklogo/7.jpg'),
          AssetImage('images/recentworklogo/8.jpg'),
          AssetImage('images/recentworklogo/9.jpg'),
          AssetImage('images/recentworklogo/10.jpg'),
          AssetImage('images/recentworklogo/11.jpg'),
          AssetImage('images/recentworklogo/12.jpg'),

        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 3.5,
        indicatorBgPadding: 4.0,
        dotBgColor: Colors.white,
        dotColor: Colors.white,
        borderRadius: true,

      ),
    ));

    Widget aboutus_carousel = new
    Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(50.0),
//        ),
        color: Colors.white,
        child: Container(
          height: 320,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          child: new Carousel(
            boxFit: BoxFit.scaleDown,
            images: [
              AssetImage('images/aboutus/aboutusimg1.jpg'),
              AssetImage('images/aboutus/aboutusimg2.jpg'),
              AssetImage('images/aboutus/aboutusimg3.jpg'),
              AssetImage('images/aboutus/aboutusimg4.jpg'),
              AssetImage('images/aboutus/aboutusimg5.jpg'),
              AssetImage('images/aboutus/aboutusimg6.jpg'),
              AssetImage('images/aboutus/aboutusimg7.jpg'),
              AssetImage('images/aboutus/aboutusimg8.jpg'),
              AssetImage('images/aboutus/aboutusimg9.jpg'),
              AssetImage('images/aboutus/aboutusimg10.jpg'),
              AssetImage('images/aboutus/aboutusimg11.jpg'),
              AssetImage('images/aboutus/aboutusimg12.jpg'),

            ],
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 3.5,
            indicatorBgPadding: 4.0,
            dotBgColor: Colors.black,
            dotColor: Colors.white,
            borderRadius: true,

          ),
        ));
    void _onTapDown(PointerDownEvent details) {
      _controller.forward();
    }
    void _onTapUp(PointerUpEvent details) {
      _controller.reverse();
    }
    void _onTapDownSecond(PointerDownEvent details) {
      _controller2.forward();
    }
    void _onTapUpSecond(PointerUpEvent details) {
      _controller2.reverse();
    }
    void _onTapDownThird(PointerDownEvent details) {
      _controller3.forward();
    }
    void _onTapUpThird(PointerUpEvent details) {
      _controller3.reverse();
    }
    void _onTapDownD1(PointerDownEvent details) {
      _controller3.forward();
    }
    void _onTapUpD1(PointerUpEvent details) {
      _controller3.reverse();
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _key,
        appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.deepOrange,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'AlAnfal',
            style: GoogleFonts.changa(
                color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),


          ),
          actions: <Widget>[
            new IconButton(
                icon: Icon(FontAwesomeIcons.phoneSquare, color: Colors.deepOrange), onPressed: () {
                  launch('tel:0020222610260');
//                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
            }),
            new IconButton(
                icon: Icon(FontAwesomeIcons.shoppingCart, color: Colors.deepOrange),
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
                          MaterialPageRoute(builder: (context) => new CartScreen()));
                  }
                  }),
            new IconButton(
                icon: Icon(FontAwesomeIcons.doorOpen, color: Colors.deepOrange),
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
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => new Login()));                },
                                            child: Text(
                                              "Sign In",
                                              style: GoogleFonts.changa(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Reject",
                                              style: GoogleFonts.changa(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            ),
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
                          MaterialPageRoute(builder: (context) => new LockPage()));
                  }
                })
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
//            user header
              DrawerHeader(
                child: Container(
                  height: 142,
                  width: MediaQuery.maybeOf(context).size.width,
                  child: Image.asset(
                    "images/logo.png",
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
//              new UserAccountsDrawerHeader(
//                accountName: Text(user.userModel?.name.toString() ?? "Not Logged In", style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 20), ),
//                accountEmail: Text(user.userModel?.email ?? "Not Logged In", style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 16),),
//                currentAccountPicture: GestureDetector(
//                  child: new CircleAvatar(
//                    backgroundColor: Colors.grey,
//                    child: Icon(
//                      Icons.person,
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//                decoration: new BoxDecoration(color: Colors.deepOrange),
//              ),
//            body of the page
              Padding(
                padding: EdgeInsets.all(0),
                child: GestureDetector(
                  onTap: () {
//                    switch(user.status){
//                      case Status.Unauthenticated:
//                        showDialog(
//                          context: context,
//                          builder: (BuildContext context){
//                            return Dialog(
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.circular(20.0)),
//                              //this right here
//                              child: Container(
//                                height: 200,
//                                child: Padding(
//                                  padding: const EdgeInsets.all(12.0),
//                                  child: Column(
//                                    mainAxisAlignment: MainAxisAlignment.center,
//                                    crossAxisAlignment:
//                                    CrossAxisAlignment.start,
//                                    children: [
//                                      Text(
//                                        'Please Sign In in order to continue',
//                                        textAlign: TextAlign.center,
//                                        style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 18),
//                                      ),
//                                      SizedBox(
//                                        width: 320.0,
//                                        child: RaisedButton(
//                                            onPressed: () {
//                                              Navigator.push(context,
//                                                  MaterialPageRoute(builder: (context) => new Login()));                },
//                                            child: Text(
//                                              "Sign In",
//                                              style: GoogleFonts.changa(
//                                                  color: Colors.white,
//                                              fontSize: 18),
//                                            ),
//                                            color: Colors.blue),
//                                      ),
//                                      SizedBox(
//                                        width: 320.0,
//                                        child: RaisedButton(
//                                            onPressed: () {
//                                              Navigator.pop(context);
//                                            },
//                                            child: Text(
//                                              "Reject",
//                                              style: GoogleFonts.changa(
//                                                  color: Colors.white,
//                                              fontSize: 18),
//                                            ),
//                                            color: Colors.red),
//                                      )
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            );}
//                      );
//                        break;
//                      default:
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new UserAccountPage()));
//                    break;
//                    }
                    },
                  child: Listener(
                    onPointerDown: _onTapDownD1,
                    onPointerUp: _onTapUpD1,
                    child: Transform.scale(
                      scale: _scaled1,
                      child: ListTile(
                        title: Text('My Account', style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                        leading: Icon(FontAwesomeIcons.user, color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
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
                                            fontSize: 18,),
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
                      await user.getOrders();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => new OrderScreen()));
                      break;
                  }
                },
                child: ListTile(
                  title: Text('My Orders', style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                  leading: Icon(FontAwesomeIcons.clipboardList, color: Colors.deepOrange),
                ),
              ),
              InkWell(
                onTap: () {
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
                          );
                          }

                    );
                    break;
                    default:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => new CartScreen()));
                      break;
                  }},
                child: ListTile(
                  title: Text('Shopping Cart', style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                  leading: Icon(FontAwesomeIcons.shoppingCart, color: Colors.deepOrange),

                ),
              ),
              InkWell(
                onTap: () async {
                  await productProvider.loadAllDoors();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Gallery()));
                },
                child: ListTile(
                  title: Text('Gallery', style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                  leading: Icon(FontAwesomeIcons.images, color: Colors.deepOrange),
                ),
              ),
              InkWell(
                onTap: () {
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
                          );
                        }

                    );
                    break;
                    default:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => new LockPage()));
                      break;
                  }},
                child: ListTile(
                  title: Text('Open Your Door', style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                  leading: Icon(FontAwesomeIcons.doorOpen, color: Colors.deepOrange),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () async {
                  await productProvider.loadAllDoors();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AskUs()));
                },
                child: ListTile(
                  title: Text('Enquiries', style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                  leading: Icon(FontAwesomeIcons.images, color: Colors.deepOrange),
                ),
              ),
              InkWell(
                onTap: () {
                  changeScreenReplacement(context, ContactUs());
                },
                child: ListTile(
                  title: Text('Contact Us', style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                  leading: Icon(FontAwesomeIcons.phone, color: Colors.grey),
                ),
              ),
              InkWell(
                onTap: () {
                  changeScreenReplacement(context, AboutUs());
                },
                child: ListTile(
                  title: Text('About Us', style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 18),),
                  leading: Icon(FontAwesomeIcons.infoCircle, color: Colors.grey),
                ),
              ),
              InkWell(
                onTap: () async {
                  await user.signOut();
                  await FirebaseAuth.instance.signOut();
//                  if (user.userModel.){
//                    user.userModel.clearUser();
//                  }
                  Navigator.of(context).pop();
                  changeScreenReplacement(context, Login());
                },
                child: ListTile(
                  title: Text('Log out', style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 18),),
                  leading: Icon(
                    FontAwesomeIcons.signOutAlt,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[

//          image carousel in homepage
              image_carousel,

//          horizontal listview begins
//          HorizontalList(),
//          Latest News
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 5.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: new Text('Categories',
                            style: GoogleFonts.changa(
                                fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160.0,
//                decoration: BoxDecoration(
////              color: Colors.deepOrange,
////                border: ,
//                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[

                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => new SafetyDoor()));
                          },
                          child: Listener(
                            onPointerDown: _onTapDown,
                            onPointerUp: _onTapUp,

                            child: Transform.scale(
                              scale: _scale,
                              child: Container(
                                width: 170.0,
//                                height: 60.0,
                                child: ListTile(
                                    title: Image.asset(
                                      'images/icon/safetydoorlogo.png',
                                      height: 120.0,

                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(

                                        alignment: Alignment.topCenter,
                                        child: Text('Safety Door', style: GoogleFonts.changa(
                                            fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        )),
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => new SafetyWindow()));
                          },
                          child: Listener(
                            onPointerDown: _onTapDownSecond,
                            onPointerUp: _onTapUpSecond,
                            child: Transform.scale(
                              scale: _scale2,
                              child: Container(
                                width: 170.0,
//                                height: 60.0,
                                child: ListTile(
                                    title: Image.asset(
                                      'images/icon/safetywindowlogo.png',
                                      height: 120.0,
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        child: Text('Safety Window', style: GoogleFonts.changa(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        )),
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
//
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => new RollingShutter()));
                        },
                        child: Listener(
                          onPointerDown: _onTapDownThird,
                          onPointerUp: _onTapUpThird,
                          child: Transform.scale(
                            scale: _scale3,
                            child: Container(
                              width: 170.0,
//                              height: 10.0,
                              child: ListTile(
                                  title: Image.asset(
                                    'images/icon/rollingshutterlogo.png',
                                    height: 120.0,

                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      child: Text('Rolling Shutter', style: GoogleFonts.changa(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => new FireDoor()));
                        },
                        child: Listener(
                          onPointerDown: _onTapDown,
                          onPointerUp: _onTapUp,

                          child: Transform.scale(
                            scale: _scale,
                            child: Container(
                              width: 170.0,
//                                height: 60.0,
                              child: ListTile(
                                  title: Image.asset(
                                    'images/icon/firedoorlogo.png',
                                    height: 120.0,

                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(

                                      alignment: Alignment.topCenter,
                                      child: Text('Fire Door', style: GoogleFonts.changa(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      )),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              'About Us',
                              style: GoogleFonts.changa(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,

                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
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
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '20 Years of Experience',
                                style: GoogleFonts.changa(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: ReadMoreText('One of the qualified companies established in 1998 response to customer '
                              'demand for completely engineered solutions to intricate technical problems.'
                              ' Following early success in such fields as specialized Doors & Windows The Company'
                              ' offer full technical expert personnel to supply, design, install. Al Anfal is '
                              'the sole agent of Gardesa Armoured doors in besides we are the distributor also '
                              'for NINZ fire doors & Mottura sefty locks @ Italy Al Anfal has a well equipment '
                              'workshop for services and maintenance',
                            trimLines: 3,
                            colorClickableText: Colors.deepOrange,
                            trimMode: TrimMode.Line,
                            textAlign: TextAlign.justify,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                          style: GoogleFonts.changa(
                            fontSize: 18
                          ),),
                        ),
                      
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => new AboutUs())
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(15),
                              child: aboutus_carousel),
                        )
                  ],
                )

              ),
              //          padding widget inside row for left alignment
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 5.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'We Keep Them Safe!',
                            style: GoogleFonts.changa(
                                fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              news_carousel,
              Divider(),
              //          recent products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.facebook, size: 40,color: Colors.blueAccent,),
                          onPressed: (){ launch(fbPageUrl);},

                        )

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.instagram, size: 40, color: Colors.purple,),
                          onPressed: (){ launch(instaUrl);},

                        )

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.youtube, size: 40, color: Colors.red,),
                          onPressed: (){ launch(youtubeUrl);},

                        )

                    ),
                  ),
                ],
              ),
              Divider(color: Colors.transparent,),
            ],
          ),
        ),
      ),
    );
  }

}
