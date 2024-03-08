//import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:alanfalproject/components/horizontal_listview.dart';
//import 'package:alanfalproject/components/products.dart';
//import 'package:alanfalproject/pages/cart.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:alanfalproject/pages/loginbasic.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  final usersReference = Firestore.instance.collection("users");
//  final FirebaseAuth auth = FirebaseAuth.instance;
//
//  @override
//  Widget build(BuildContext context) {
//    Widget image_carousel = new Container(
//      height: 200,
//      child: new Carousel(
//        boxFit: BoxFit.cover,
//        images: [
//          AssetImage('images/c1.jpg'),
//          AssetImage('images/m1.jpeg'),
//          AssetImage('images/m2.jpg'),
//          AssetImage('images/w1.jpeg'),
//          AssetImage('images/w3.jpeg'),
//          AssetImage('images/w4.jpeg'),
//        ],
//        autoplay: false,
//        animationCurve: Curves.fastOutSlowIn,
//        animationDuration: Duration(milliseconds: 1000),
//        dotSize: 3.5,
//        indicatorBgPadding: 4.0,
//        dotBgColor: Colors.transparent,
//        dotColor: Colors.white,
//      ),
//    );
//    return Scaffold(
//      appBar: new AppBar(
//        elevation: 0.2,
//        backgroundColor: Colors.red,
//        title: Text('AlAnfal'),
//        actions: <Widget>[
//          new IconButton(
//              icon: Icon(Icons.search, color: Colors.white),
//              onPressed: () {}
//          ),
//          new IconButton(
//              icon: Icon(Icons.shopping_cart, color: Colors.white),
//              onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => new Cart()));
//              }
//          )
//        ],
//      ),
//      drawer: new Drawer(
//        child: new ListView(
//            children: <Widget>[
////            user header
//        new UserAccountsDrawerHeader(
//        accountName: Text('Walid'),
//        accountEmail: Text('waldaexist@gmail.com'),
//        currentAccountPicture: GestureDetector(
//          child: new CircleAvatar(
//            backgroundColor: Colors.grey,
//            child: Icon(Icons.person, color: Colors.white,),
//          ),
//        ),
//        decoration: new BoxDecoration(
//            color: Colors.pink
//        ),
//      ),
////            body of the page
//      InkWell(
//        onTap: () {},
//        child: ListTile(
//          title: Text('HomePage'),
//          leading: Icon(Icons.home, color: Colors.pink),
//        ),
//      ),
//      InkWell(
//        onTap: () {},
//        child: ListTile(
//          title: Text('My Account'),
//          leading: Icon(Icons.person, color: Colors.pink),
//        ),
//      ),
//      InkWell(
//        onTap: () {},
//        child: ListTile(
//          title: Text('My Orders'),
//          leading: Icon(Icons.shopping_basket, color: Colors.pink),
//        ),
//      ),
//      InkWell(
//        onTap: () {
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => new Cart()));
//        },
//        child: ListTile(
//          title: Text('Shopping Cart'),
//          leading: Icon(Icons.shopping_cart, color: Colors.pink),
//        ),
//      ),
//      InkWell(
//        onTap: () {},
//        child: ListTile(
//          title: Text('Favourites'),
//          leading: Icon(Icons.favorite, color: Colors.pink),
//        ),
//      ),
//      Divider(),
//      InkWell(
//        onTap: () {},
//        child: ListTile(
//          title: Text('Settings'),
//          leading: Icon(Icons.favorite, color: Colors.grey),
//        ),
//      ),
//      InkWell(
//        onTap: () {
//          FirebaseAuth.instance.signOut().then((value) {
////            Navigator.pushReplacement(
////                context, MaterialPageRoute(builder: (context) => Login()));
//          });
//        },
//        child: ListTile(
//          title: Text('Log out'),
//          leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
//        ),
//      ),
//
//    ],
//    ),
//    ),
//    body: new Column(
//    children: <Widget>[
////          image carousel in homepage
//    image_carousel,
////          padding widget
//    new Padding(padding: const EdgeInsets.all(15.0),
//    child: new Text('Categories'),
//    ),
////          horizontal listview begins
//    HorizontalList(),
//    new Padding(padding: const EdgeInsets.all(15.0),
//    child: Container(
//    alignment: Alignment.centerLeft,
//    child: new Text('Recent Products'),
//    ),
//    ),
////          grid view
//    Flexible(
//    child: Products(),
//    ),
//    ],
//    ),
//    );
//  }
//}
