import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../db/lockcount.dart';
import '../db/locktype.dart';
import 'package:alanfaladmin/db/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alanfaladmin/screens/addproduct.dart';
import 'addlocktype.dart';
import 'addsafewindow.dart';
import 'orders.dart';
import 'package:alanfaladmin/screens/users.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController lockCountController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> lockCountFormKey = GlobalKey();
  GlobalKey<FormState> _addLockFormKey = GlobalKey();
  LockTypeService lockTypeService = LockTypeService();
  LockCountService lockCountService = LockCountService();
  ProductService productService = ProductService();
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var prod = productService.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.dashboard);
                      },
                      icon: Icon(
                        Icons.dashboard,
                        color: _selectedPage == Page.dashboard
                            ? active
                            : notActive,
                      ),
                      label: Text('Dashboard'))),
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.manage);
                      },
                      icon: Icon(
                        Icons.sort,
                        color:
                            _selectedPage == Page.manage ? active : notActive,
                      ),
                      label: Text('Manage'))),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              subtitle: FlatButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.green,
                ),
                label: Text('12,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: Colors.green)),
              ),
              title: Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(

                              onPressed: null,
                              icon: Icon(Icons.people_outline),
                              label: Text("Users")),
                          subtitle: Text(
                            '7',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.category),
                              label: Text("Categories")),
                          subtitle: Text(
                            '23',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.track_changes),
                              label: Text("Products")),
                          subtitle: Text(
                            '',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.tag_faces),
                              label: Text("Sold")),
                          subtitle: Text(
                            '13',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.shopping_cart),
                              label: Text("Orders")),
                          subtitle: Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.close),
                              label: Text("Return")),
                          subtitle: Text(
                            '0',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        break;
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text("View Orders"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new OrderScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("View Users"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new UsersScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add product"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new AddProduct()));
                },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add Safety Window"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new AddSafetyWindow()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Products list"),
              onTap: () {
                productService.getProducts();
              },
            ),
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }

  void addLockCount() {
    var alert = new AlertDialog(
      content: Form(
        key: lockCountFormKey,
        child: TextFormField(
          controller: lockCountController,
          validator: (lcvalue){
            if(lcvalue.isEmpty){
              return 'Field cannot be empty';
            }
          },
          decoration: InputDecoration(
            hintText: "Add Lock Count"
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          if(lockCountController.text != ''){
            lockCountService.createLockCount(lockCountController.text);
            Fluttertoast.showToast(msg: 'Lock Count created :)');
            Navigator.pop(context);
          }
        }, child: Text('ADD')),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('CANCEL')),

      ],

    );

    showDialog(context: context, builder: (_) => alert);
  }

//  void addLockAlert() {
//    var alert = new AlertDialog(
//      content: Form(
//        key: _addLockFormKey,
//        child: TextFormField(
//          controller: brandController,
//          validator: (value){
//            if(value.isEmpty){
//              return 'category cannot be empty';
//            }
//          },
//          decoration: InputDecoration(
//              hintText: "add brand"
//          ),
//        ),
//      ),
//      actions: <Widget>[
//        FlatButton(onPressed: (){
//          if(brandController.text != null){
//            _brandService.createLockType(brandController.text, 'lol');
//          }
////          Fluttertoast.showToast(msg: 'brand added');
//          Navigator.pop(context);
//        }, child: Text('ADD')),
//        FlatButton(onPressed: (){
//          Navigator.pop(context);
//        }, child: Text('CANCEL')),
//
//      ],
//    );
//
//    showDialog(context: context, builder: (_) => alert);
//  }
}
