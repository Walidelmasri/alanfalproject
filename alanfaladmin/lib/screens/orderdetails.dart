import 'package:flutter/material.dart';
import 'package:alanfaladmin/provider/order.dart';
import 'package:provider/provider.dart';
import 'package:alanfaladmin/service/order.dart';
import 'package:alanfaladmin/models/order.dart';
import 'package:alanfaladmin/models/cartitem.dart';

class OrderDetails extends StatefulWidget {
  final OrderModel order;
  const OrderDetails ({Key key, this.order}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {



  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    OrderServices orderServices = OrderServices();


    return Scaffold(
      appBar: new AppBar(
        elevation: 0.2,
        backgroundColor: Colors.black,
        title: Text('Order Details',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.red),
              onPressed: (){}
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: widget.order.cart.length,
          itemBuilder: (_, index){
//            List<CartItemModel> cartItemModel = orderProvider.orders[index].cart[index].id;
            return Container(
              child: Column(
                children: <Widget>[
                  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      color: Colors.black12
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Text('Item ' +  (1 + index).toString(), style: TextStyle(fontSize: 22),),

                      ],
                    ),
                  ),
                ),
                  Divider(color: Colors.transparent,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                        color: Colors.black12
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Text('Item Image: ', style: TextStyle(fontSize: 22),),
                          Image.network(
                            widget.order.cart[index].image,
                            height: 200,
//                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                        color: Colors.black12
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Text('Item Price: '),
                          Text(
                            "EGP ${widget.order.cart[index].price}",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                        color: Colors.black12
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Text('Item Name: '),
                        Text(widget.order.cart[index].name),
            ],
                    ),),
                  ),
                  Divider(color: Colors.transparent,),
                  Visibility(
                    visible: widget.order.cart[index].size != null,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Colors.black12
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('Door Size: '),
                            Text(widget.order.cart[index].size ?? 'Not Applicable'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent,),
                  Visibility(
                    visible: widget.order.cart[index].locktype != null,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Colors.black12
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('LockType: '),
                            Text(widget.order.cart[index].locktype ?? 'Not Applicable'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent,),
                  Visibility(
                    visible: widget.order.cart[index].windowwidth != null,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Colors.black12
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('Window Width: '),
                          Text(widget.order.cart[index].windowwidth ?? 'Not Applicable'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Visibility(
                    visible: widget.order.cart[index].windowheight != null,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Colors.black12
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('Window Height: '),
                            Text(widget.order.cart[index].windowheight ?? 'Not Applicable'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent,),
                  Visibility(
                    visible: widget.order.cart[index].wdalfatype != null,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Colors.black12
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('Window Dalfa Number: '),
                            Text(widget.order.cart[index].wdalfatype ?? 'Not Applicable'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Visibility(
                    visible: widget.order.cart[index].wmotortype != null,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: Colors.black12
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('Window Motor Type: '),
                            Text(widget.order.cart[index].wmotortype ?? 'Not Applicable'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],

              ),
            );
          },
      ),
        floatingActionButton: FloatingActionButton(
            elevation: 10.0,
            child: Icon(Icons.add),
            onPressed: (){
              // action on button press
            }
        ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12
                    ),
                    child: Text("Client Details: ", style: TextStyle(fontSize: 20),)
                )
            ),
            Padding(
              padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12
                  ),
                    child: Text("Username: \n" + widget.order.name, style: TextStyle(fontSize: 20),)
                )
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12
                    ),
                    child: Text("Email: \n" + widget.order.email, style: TextStyle(fontSize: 20),)
                )
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12
                    ),
                    child: Text("Phone Number: \n" + widget.order.phonenumber, style: TextStyle(fontSize: 20),)
                )
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12
                    ),
                    child: Text("Address: \n" + widget.order.address, style: TextStyle(fontSize: 20),)
                )
            ),
            MaterialButton(
              onPressed: () {
                widget.order.acceptOrder();
                Navigator.pop(context);
              },
              minWidth: MediaQuery.of(context).size.width,
              child: Text(
                "Accept Order",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
