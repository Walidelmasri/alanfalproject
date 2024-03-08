import 'package:flutter/material.dart';
import 'package:alanfalproject/services/order.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alanfalproject/models/order.dart';
import 'package:alanfalproject/pages/orderdetails.dart';


class OrderScreen extends StatefulWidget {
  final OrderModel order;
  const OrderScreen({Key key, this.order}) : super(key: key);
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrderScreen> {

  OrderServices orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('My Orders',
          style: GoogleFonts.changa(fontSize: 30, color: Colors.black,
            fontWeight: FontWeight.bold,
          ),textAlign: TextAlign.center,),
        actions: <Widget>[

        ],
      ),
      body: ListView.builder(
          itemCount: userProvider.orders.length,
          itemBuilder: (_, index){
            OrderModel _order = userProvider.orders[index];
            return InkWell(
              onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new OrderDetails(order: _order)));
                },

              child: Card(
                child: ListTile(
                  leading: Text(
                    _order.description,
                      style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  title: Text('Number Of Items: ' + _order.cart.length.toString(), style: GoogleFonts.changa(fontSize: 18, color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
//              subtitle: Text(DateTime.fromMillisecondsSinceEpoch(_order.createdAt).toString()),
                  trailing: Text(_order.status, style: GoogleFonts.changa(

                  ),),
                ),
              ),
            );
          }),
    );

  }
//  orders(String userid){
//    setState(() async {
//      orders = orderServices.getUserOrders(userId: userid);
//    });
//  }


}
