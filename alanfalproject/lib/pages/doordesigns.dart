import 'package:flutter/material.dart';
import 'package:alanfalproject/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/widgets/product_card.dart';
import 'package:google_fonts/google_fonts.dart';
enum Page { Flash, Router, Molded }

class DoorDesigns extends StatefulWidget {
  @override
  _DoorDesignsState createState() => _DoorDesignsState();
}

class _DoorDesignsState extends State<DoorDesigns> {

  Page _selectedPage = Page.Flash;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController lockCountController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> lockCountFormKey = GlobalKey();
  GlobalKey<FormState> _addLockFormKey = GlobalKey();
//  LockTypeService lockTypeService = LockTypeService();
//  LockCountService lockCountService = LockCountService();
//  ProductService productService = ProductService();
//  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    var prod = productService.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Door Designs',
            style: GoogleFonts.changa(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,

            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: FlatButton.icon(
                          onPressed: () {
                            setState(() => _selectedPage = Page.Flash);
                          },
                          icon: Icon(
                            Icons.dashboard,
                            size: 10,
                            color: _selectedPage == Page.Flash
                                ? active
                                : notActive,
                          ),
                          label: Text('Flash', style: GoogleFonts.changa(fontSize: 20),))),
                  Expanded(
                      child: FlatButton.icon(
                          onPressed: () {
                            setState(() => _selectedPage = Page.Router);
                          },
                          icon: Icon(
                            Icons.sort,
                            size: 10,
                            color:
                            _selectedPage == Page.Router ? active : notActive,
                          ),
                          label: Text('Router',style: GoogleFonts.changa(fontSize: 20)))),
                  Expanded(
                      child: FlatButton.icon(
                          onPressed: () {
                            setState(() => _selectedPage = Page.Molded);
                          },
                          icon: Icon(
                            Icons.sort,
                            size: 10,
                            color:
                            _selectedPage == Page.Molded ? active : notActive,
                          ),
                          label: Text('Molded',style: GoogleFonts.changa(fontSize: 20)))),
                ],
              ),
              Expanded(child: _loadScreen())

            ]
        )
    );

  }

  Widget _loadScreen() {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    switch (_selectedPage) {
      case Page.Flash:
//        return Column(
//          children: <Widget>[
//            ListTile(
//              subtitle: FlatButton.icon(
//                onPressed: null,
//                icon: Icon(
//                  Icons.attach_money,
//                  size: 30.0,
//                  color: Colors.green,
//                ),
//                label: Text('12,000',
//                    textAlign: TextAlign.center,
//                    style: TextStyle(fontSize: 30.0, color: Colors.green)),
//              ),
//              title: Text(
//                'Revenue',
//                textAlign: TextAlign.center,
//                style: TextStyle(fontSize: 24.0, color: Colors.grey),
//              ),
//            ),
//            Expanded(
//              child: GridView(
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                    crossAxisCount: 2),
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(18.0),
//                    child: Card(
//                      child: ListTile(
//                          title: FlatButton.icon(
//                              onPressed: null,
//                              icon: Icon(Icons.people_outline),
//                              label: Text("Users")),
//                          subtitle: Text(
//                            '7',
//                            textAlign: TextAlign.center,
//                            style: TextStyle(color: active, fontSize: 60.0),
//                          )),
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(18.0),
//                    child: Card(
//                      child: ListTile(
//                          title: FlatButton.icon(
//                              onPressed: null,
//                              icon: Icon(Icons.category),
//                              label: Text("Categories")),
//                          subtitle: Text(
//                            '23',
//                            textAlign: TextAlign.center,
//                            style: TextStyle(color: active, fontSize: 60.0),
//                          )),
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(22.0),
//                    child: Card(
//                      child: ListTile(
//                          title: FlatButton.icon(
//                              onPressed: null,
//                              icon: Icon(Icons.track_changes),
//                              label: Text("Products")),
//                          subtitle: Text(
//                            '',
//                            textAlign: TextAlign.center,
//                            style: TextStyle(color: active, fontSize: 60.0),
//                          )),
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(22.0),
//                    child: Card(
//                      child: ListTile(
//                          title: FlatButton.icon(
//                              onPressed: null,
//                              icon: Icon(Icons.tag_faces),
//                              label: Text("Sold")),
//                          subtitle: Text(
//                            '13',
//                            textAlign: TextAlign.center,
//                            style: TextStyle(color: active, fontSize: 60.0),
//                          )),
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(22.0),
//                    child: Card(
//                      child: ListTile(
//                          title: FlatButton.icon(
//                              onPressed: null,
//                              icon: Icon(Icons.shopping_cart),
//                              label: Text("Orders")),
//                          subtitle: Text(
//                            '5',
//                            textAlign: TextAlign.center,
//                            style: TextStyle(color: active, fontSize: 60.0),
//                          )),
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(22.0),
//                    child: Card(
//                      child: ListTile(
//                          title: FlatButton.icon(
//                              onPressed: null,
//                              icon: Icon(Icons.close),
//                              label: Text("Return")),
//                          subtitle: Text(
//                            '0',
//                            textAlign: TextAlign.center,
//                            style: TextStyle(color: active, fontSize: 60.0),
//                          )),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ],
//        );
        return GridView.count(
//            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                maxCrossAxisExtent: 200,
//                childAspectRatio: 2 / 2,
//                crossAxisSpacing: 10,
//                mainAxisSpacing: 10),
//            itemCount: productProvider.products.length,
//            itemBuilder: (BuildContext ctx, index) {
//              return Expanded(
//                child: Column(
//                  children: productProvider.products
//                      .map((item) => GestureDetector(
//                    child: ProductCard(
//                      product: item,
//                    ),
//                  ))
//                      .toList(),
//                ),
//              );
//            });
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 8,
        children: productProvider.products
                      .map((item) => GestureDetector(
                    child: ProductCard(
                      product: item,
                    ),
                  ))
                      .toList(),
        );
        break;
      case Page.Router:
//        return ListView(
//          children: <Widget>[
//            ListTile(
//              leading: Icon(Icons.add),
//              title: Text("View Orders"),
//              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => new OrderScreen()));
//              },
//            ),
//            Divider(),
//            ListTile(
//              leading: Icon(Icons.add),
//              title: Text("Add product"),
//              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => new AddProduct()));
//              },
//            ),
//            Divider(),
//            ListTile(
//              leading: Icon(Icons.add),
//              title: Text("Add Safety Window"),
//              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => new AddSafetyWindow()));
//              },
//            ),
//            Divider(),
//            ListTile(
//              leading: Icon(Icons.change_history),
//              title: Text("Products list"),
//              onTap: () {
//                productService.getProducts();
//              },
//            ),
//            Divider(),
//            ListTile(
//              leading: Icon(Icons.add_circle_outline),
//              title: Text("Add Lock Type"),
//              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => new OrderScreen()));
//              },
//            ),
//            Divider(),
//            ListTile(
//              leading: Icon(Icons.category),
//              title: Text("Lock Types Available"),
//              onTap: () {
//                lockTypeService.getLockTypes();
//              },
//            ),
//            Divider(),
//            ListTile(
//              leading: Icon(Icons.add_circle_outline),
//              title: Text("Add Lock Type"),
//              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => new AddLockType()));
//              },
//            ),
//            Divider(),
//            ListTile(
//              leading: Icon(Icons.library_books),
//              title: Text("brand list"),
//              onTap: () {},
//            ),
//            Divider(),
//          ],
//        );
        return GridView.count(
//            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                maxCrossAxisExtent: 200,
//                childAspectRatio: 2 / 2,
//                crossAxisSpacing: 10,
//                mainAxisSpacing: 10),
//            itemCount: productProvider.products.length,
//            itemBuilder: (BuildContext ctx, index) {
//              return Expanded(
//                child: Column(
//                  children: productProvider.products
//                      .map((item) => GestureDetector(
//                    child: ProductCard(
//                      product: item,
//                    ),
//                  ))
//                      .toList(),
//                ),
//              );
//            });
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 8,
          children: productProvider.routerDoors
              .map((item) => GestureDetector(
            child: ProductCard(
              product: item,
            ),
          ))
              .toList(),
        );
        break;
      case Page.Molded:
        return GridView.count(
//            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                maxCrossAxisExtent: 200,
//                childAspectRatio: 2 / 2,
//                crossAxisSpacing: 10,
//                mainAxisSpacing: 10),
//            itemCount: productProvider.products.length,
//            itemBuilder: (BuildContext ctx, index) {
//              return Expanded(
//                child: Column(
//                  children: productProvider.products
//                      .map((item) => GestureDetector(
//                    child: ProductCard(
//                      product: item,
//                    ),
//                  ))
//                      .toList(),
//                ),
//              );
//            });
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 8,
          children: productProvider.moldedDoors
              .map((item) => GestureDetector(
            child: ProductCard(
              product: item,
            ),
          ))
              .toList(),
        );
      default:
        return Container();
    }
  }
}
