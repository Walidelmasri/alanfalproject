import 'package:alanfalproject/helpers/style.dart';
import 'package:alanfalproject/providers/auth.dart';
import 'package:alanfalproject/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:alanfalproject/components/horizontal_listview.dart';
import 'package:alanfalproject/models/product.dart';
import 'package:alanfalproject/pages/cart.dart';
import 'package:alanfalproject/providers/app_provider.dart';
import 'package:alanfalproject/helpers/screen_navigation.dart';
import 'package:alanfalproject/pages/login.dart';
import 'package:alanfalproject/widgets/featured_products.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:alanfalproject/providers/product_provider.dart';
import 'package:alanfalproject/widgets/product_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    final auth = Provider.of<UserProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<Product> productList = [];

//    final auth = Provider.of<AuthProvider>(context);
    Widget image_carousel = new Container(
      height: 200,
      child: new Carousel(
        boxFit: BoxFit.cover,
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
        dotBgColor: Colors.transparent,
        dotColor: Colors.white,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.white,),
        elevation: 0.2,
        backgroundColor: Colors.black,
        title: Text('AlAnfal',
        style: TextStyle(
          color: Colors.white,
        ),),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {}
          ),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              }
          )
        ],
      ),

      drawer: new Drawer(

        child: new ListView(
          children: <Widget>[
//            user header
            DrawerHeader(
              child: Container(
                  height: 142,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "images/logo.png",
                  ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),

              ),

            ),
            new UserAccountsDrawerHeader(
              accountName: Text('Walid'),
              accountEmail: Text('waldaexist@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.redAccent
              ),
            ),
//            body of the page
            InkWell(
              onTap: () {changeScreenReplacement(context, Home());},
              child: ListTile(
                title: Text('HomePage'),
                leading: Icon(Icons.home, color: Colors.redAccent),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.redAccent),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.redAccent),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.redAccent),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.redAccent),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.favorite, color: Colors.grey),
              ),
            ),
            InkWell(
              onTap: () {
                auth.signOut();
                Navigator.of(context).pop();
                changeScreenReplacement(context, Login());
              },

              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),
          ],
        ),
      ),
      body: new Column(

        children: <Widget>[
//          image carousel in homepage
          image_carousel,
//          padding widget inside row for left alignment

          Container(
//            color: Colors.grey,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                        child: new Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                          ),),
                      ),
                ),
              ],
            ),
          ),
//          horizontal listview begins
//          HorizontalList(),

            Container(
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.redAccent,
//                border: ,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  InkWell(
                    child: Category(
                      imglocation: 'images/cats/fire_doors.png',
                      imgcaption: 'Fire Doors',
                    ),
                    onTap: (){
                      productProvider.loadProducts('roof');
                    },
                  ),
                  Category(
                    imglocation: 'images/cats/saftey_doors.png',
                    imgcaption: 'Safety Doors',
                  ),
                  Category(
                    imglocation: 'images/cats/safety_window.png',
                  imgcaption: 'Safety Windows',
                  ),
                  Category(
                    imglocation: 'images/cats/rolling_shutter.png',
                    imgcaption: 'Rolling Shutters',
                  ),

              ],
            ),
            ),
//          grid view
//          FeaturedProducts(),

          //          recent products
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: new Text('Recent products')),
              ),
            ],
          ),

//          Flexible(
////            child: Column(
////              children: productProvider.products
////                  .map((item) => GestureDetector(
////                child: ProductCard(
////                  name: item.name,
////                ),
////              ))
////                  .toList(),
////
////            ),
////          )
        Expanded(
//          height: 100.0,
          child: Container(

            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                for(var i = 0; i < productProvider.products.length; i++)
                  new ProductCard(name: productProvider.products[i].name,)
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
//  Widget allProducts(){
//  ProductProvider productProvider = Provider.of<ProductProvider>(context);
//    for (var i = 0; i < productProvider.products.length; i++){
//      print(productProvider.products.length);
//      return ProductCard(name: productProvider.products[i].name,);
//    }
//  }
}
//Flexible(
//child: Column(
//children: productProvider.products
//    .map((item) => GestureDetector(
//child: ProductCard(
//name: item.name,
//),
//))
//.toList(),
//
//),
//)
