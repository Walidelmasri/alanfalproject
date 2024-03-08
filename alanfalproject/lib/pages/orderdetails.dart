import 'package:flutter/material.dart';
import 'package:alanfalproject/models/order.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetails extends StatefulWidget {
  final OrderModel order;
  const OrderDetails({Key key, this.order}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(widget.order.userId,
          style: GoogleFonts.changa(fontSize: 30, color: Colors.black,
            fontWeight: FontWeight.bold,
          ),textAlign: TextAlign.center,),
        actions: <Widget>[

        ],
      ),
      body: ListView.builder(
        itemCount: widget.order.cart.length,
        itemBuilder: (_, index){
          return Container(
            child: Column(
              children: <Widget>[
                Card(
                  child: Container(
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                      color: Colors.black12
//                  ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Text('Item ' +  (1 + index).toString(),style: GoogleFonts.changa(fontSize: 22, color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),

                        ],
                      ),
                    ),
                  ),
                ),
//                Divider(color: Colors.transparent,),
                Card(
                  child: Container(
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                      color: Colors.black12
//                  ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Text('Item Price: ',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                          Text(
                            "EGP ${widget.order.cart[index].price}",style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                            fontWeight: FontWeight.bold,)
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
//                Divider(color: Colors.transparent,),

                Card(
                  child: Container(
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                      color: Colors.black12
//                  ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Text('Item Name: ',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                          Text(widget.order.cart[index].name,style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                        ],
                      ),),
                  ),
                ),
//                Divider(color: Colors.transparent,),
                Visibility(
                  visible: widget.order.cart[index].size != null,
                  child: Card(
                    child: Container(
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                          color: Colors.black12
//                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('Door Size: ',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                            Text(widget.order.cart[index].size ?? 'Not Applicable',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
//                Divider(color: Colors.transparent,),
                Card(
                  child: Visibility(
                    visible: widget.order.cart[index].locktype != null,
                    child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                        color: Colors.black12
//                    ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('LockType: ',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                            Text(widget.order.cart[index].locktype ?? 'Not Applicable',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
//                Divider(color: Colors.transparent,),
                Card(
                  child: Visibility(
                    visible: widget.order.cart[index].windowwidth != null,
                    child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                        color: Colors.black12
//                    ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('Window Width: ',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                            Text(widget.order.cart[index].windowwidth ?? 'Not Applicable',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
//                Divider(color: Colors.transparent,),
                Card(
                  child: Visibility(
                    visible: widget.order.cart[index].windowheight != null,
                    child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                        color: Colors.black12
//                    ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('Window Height: ',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                            Text(widget.order.cart[index].windowheight ?? 'Not Applicable',style: GoogleFonts.changa(fontSize: 185 , color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
//                Divider(color: Colors.transparent,),
                Card(
                  child: Visibility(
                    visible: widget.order.cart[index].wdalfatype != null,
                  child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                        color: Colors.black12
//                    ),
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
                ),
//                Divider(color: Colors.transparent,),
                Card(
                  child: Visibility(
                    visible: widget.order.cart[index].wmotortype != null,
                    child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//                        color: Colors.black12
//                    ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text('Window Motor Type: ',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                            Text(widget.order.cart[index].wmotortype ?? 'Not Applicable',style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
