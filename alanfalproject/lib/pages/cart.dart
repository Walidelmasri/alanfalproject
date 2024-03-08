//import 'package:flutter/material.dart';
//import 'package:alanfalproject/components/cart_products.dart';
//
//class Cart extends StatefulWidget {
//  @override
//  _CartState createState() => _CartState();
//}
//
//class _CartState extends State<Cart> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: new AppBar(
//        iconTheme: IconThemeData(
//          color: Colors.white,
//        ),
//        elevation: 0.2,
//        backgroundColor: Colors.black,
//        title: Text('Cart', style: TextStyle(
//          color: Colors.white,
//        ),),
//        actions: <Widget>[
//          new IconButton(
//              icon: Icon(Icons.search, color: Colors.white),
//              onPressed: (){}
//          ),
//        ],
//      ),
//      body: new CartProducts(),
//
//      bottomNavigationBar: new Container(
//        color: Colors.white,
//        child: Row(
//          children: <Widget>[
//            Expanded(
//              child: ListTile(
//                title: new Text('Total Amount: '),
//                subtitle: new Text('230'),
//              ),
//            ),
//            Expanded(
//              child: new MaterialButton(
//                onPressed: (){},
//                child: new Text('Check Out',
//                style: TextStyle(
//                  color: Colors.white
//                ),),
//                color: Colors.red,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
import 'package:alanfalproject/helpers/style.dart';
import 'package:alanfalproject/models/cartitem.dart';
import 'package:alanfalproject/providers/app_provider.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:alanfalproject/services/order.dart';
import 'package:alanfalproject/widgets/custom_text.dart';
import 'package:alanfalproject/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:alanfalproject/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepOrange),
        backgroundColor: white,
        elevation: 0.0,
        title: Text('Shopping Cart', style: GoogleFonts.changa(color: Colors.black, fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: appProvider.isLoading
          ? Loading()
          : ListView.builder(
          itemCount: userProvider.userModel.cart.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.deepOrange.withOpacity(0.2),
                          offset: Offset(3, 2),
                          blurRadius: 30)
                    ]),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      child: Image.network(
                        userProvider.userModel.cart[index].image,
//                      'https://4.imimg.com/data4/QY/YX/MY-23796424/wooden-work-500x500.jpg',
                        height: 120,
                        width: 140,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: userProvider
                                      .userModel.cart[index].name +
                                      "\n",
                                  style: GoogleFonts.changa(
                                      color: black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                  "EGP ${userProvider.userModel.cart[index].price} \n",
                                  style: GoogleFonts.changa(
                                      color: black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300)),
//                              TextSpan(
//                                  text:
//                                  "${userProvider.userModel.cart[index].locktype} Lock \n",
//                                  style: TextStyle(
//                                      color: black,
//                                      fontSize: 18,
//                                      fontWeight: FontWeight.w300)),
//                              TextSpan(
//                                  text:
//                                  "${userProvider.userModel.cart[index].size} Cm \n",
//                                  style: TextStyle(
//                                      color: black,
//                                      fontSize: 18,
//                                      fontWeight: FontWeight.w300)),
                            ]),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: red,
                              ),
                              onPressed: () async {
                                appProvider.changeIsLoading();
                                bool success =
                                await userProvider.removeFromCart(
                                    cartItem: userProvider
                                        .userModel.cart[index]);
                                if (success) {
                                  userProvider.reloadUserModel();
                                  print("Item added to cart");
                                  _key.currentState.showSnackBar(SnackBar(
                                      content: Text("Removed from Cart!")));
                                  appProvider.changeIsLoading();
                                  return;
                                } else {
                                  appProvider.changeIsLoading();
                                }
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Total: ",
                      style: GoogleFonts.changa(color: Colors.black, fontSize: 30)),
                  TextSpan(
                      text: " EGP ${userProvider.userModel.totalCartPrice}",
                      style: GoogleFonts.changa(color: Colors.black, fontSize: 27)),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.deepOrange),
                child: FlatButton(
                    onPressed: () {
                      if (userProvider.userModel.totalCartPrice == 0) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                //this right here
                                child: Container(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Your cart is emty',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                        return;
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              //this right here
                              child: Container(
                                height: 500,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You will be charged EGP ${userProvider.userModel.totalCartPrice} plus delivery fees! Are these your Items?',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: userProvider.userModel.cart.length,
                                          itemBuilder: (_, index){
                                            return Column(
                                              children: <Widget>[
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
                                                  child: ListTile(
                                                    title: Text('Item ' + (1 + index).toString(), style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
//                                                    leading: Icon(Icons.person, color: Colors.deepOrange),
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
                                                  child: ListTile(
                                                    title: Text('Item Name:  ' + userProvider.userModel.cart[index].name, style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: userProvider.userModel.cart[index].locktype != null,
                                                  child: Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    margin: EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5.0,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Colors.white70,
                                                    child: ListTile(
                                                      title: Text('Locktype:  ' + userProvider.userModel.cart[index].locktype.toString(), style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: userProvider.userModel.cart[index].size != null,
                                                  child: Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    margin: EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5.0,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Colors.white70,
                                                    child: ListTile(
                                                      title: Text('Size:  ' + userProvider.userModel.cart[index].size.toString(), style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: userProvider.userModel.cart[index].doordalfa != null,
                                                  child: Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    margin: EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5.0,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Colors.white70,
                                                    child: ListTile(
                                                      title: Text('Dalfa Type:  ' + userProvider.userModel.cart[index].doordalfa.toString(), style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: userProvider.userModel.cart[index].windowheight != null,
                                                  child: Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    margin: EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5.0,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Colors.white70,
                                                    child: ListTile(
                                                      title: Text('Window Height:  ' + userProvider.userModel.cart[index].windowheight.toString(), style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: userProvider.userModel.cart[index].windowwidth != null,
                                                  child: Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    margin: EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5.0,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Colors.white70,
                                                    child: ListTile(
                                                      title: Text('Window Width:  ' + userProvider.userModel.cart[index].windowwidth.toString(), style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: userProvider.userModel.cart[index].wdalfatype != null,
                                                  child: Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    margin: EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5.0,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Colors.white70,
                                                    child: ListTile(
                                                      title: Text('Dalfa Type:  ' + userProvider.userModel.cart[index].wdalfatype.toString(), style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: userProvider.userModel.cart[index].wmotortype != null,
                                                  child: Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    margin: EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5.0,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Colors.white70,
                                                    child: ListTile(
                                                      title: Text('Motor Type:  ' + userProvider.userModel.cart[index].wmotortype.toString(), style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: userProvider.userModel.cart[index].notes != null,
                                                  child: Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    margin: EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5.0,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Colors.white70,
                                                    child: ListTile(
                                                      title: Text('Additional Notes:  ' + userProvider.userModel.cart[index].notes.toString(), style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18),),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            var uuid = Uuid();
                                            String id = uuid.v4();
                                            _orderServices.createOrder(
                                                userId: userProvider.user.uid,
                                                username: userProvider.userModel.name,
                                                id: id,
                                                description: DateTime.now().toString(),
                                                status: "pending",
                                                phonenumber: userProvider.userModel.phonenumber,
                                                email: userProvider.userModel.email,
                                                address: userProvider.userModel.address,
                                                totalPrice: userProvider
                                                    .userModel.totalCartPrice,
                                                cartlength: userProvider.userModel.cart.length,
                                                cart: userProvider
                                                    .userModel.cart);
                                            for (CartItemModel cartItem
                                            in userProvider
                                                .userModel.cart) {
                                              bool value = await userProvider
                                                  .removeFromCart(
                                                  cartItem: cartItem);
                                              if (value) {
                                                userProvider.reloadUserModel();
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(builder: (BuildContext context) => Home()));                                                print("Item added to cart");
                                                _key.currentState.showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            "Removed from Cart!")));
                                              } else {
                                                print("ITEM WAS NOT REMOVED");
                                              }
                                            }
                                            _key.currentState.showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Order created!")));

                                          },
                                          child: Text(
                                            "Accept",
                                            style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),
                                          ),
                                          color: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Reject",
                                              style: GoogleFonts.changa(fontWeight: FontWeight.bold,fontSize: 18, color: Colors.white),
                                            ),
                                            color: red),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Text("Check out",
                      style: GoogleFonts.changa(
                        fontSize: 22
                      ),

                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}