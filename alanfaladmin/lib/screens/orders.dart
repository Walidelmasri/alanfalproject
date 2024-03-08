import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alanfaladmin/service/order.dart';
import 'package:alanfaladmin/models/order.dart';
import 'package:provider/provider.dart';
import 'package:alanfaladmin/provider/order.dart';
import 'package:alanfaladmin/screens/orderdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class OrderScreen extends StatefulWidget {
  final OrderModel order;
  const OrderScreen({Key key, this.order}) : super(key: key);
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  OrderServices orderServices = OrderServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderServices.getAllOrders();

  }
  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.2,
        backgroundColor: Colors.black,
        title: Text('View Orders',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.red),
              onPressed: (){
                setState(() {
                  orderProvider.reloadOrderModel();
                });
              }
          ),
        ],
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: orderProvider.getOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          return  ListView.builder(
              itemCount: orderProvider.orders.length,
              itemBuilder: (_, index){
                OrderModel _order = orderProvider.orders[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new OrderDetails(order: _order)));
//                print(orderProvider.orderModel.description);
                  },
                  child: ListTile(
                    leading: Text(
                      "\$${_order.total}",
                    ),
                    title: Text(_order.description),
                    subtitle: Text("\$${_order.cart.length}"),
//              subtitle: Text(DateTime.fromMillisecondsSinceEpoch(_order.createdAt).toString()),
                    trailing: Text(_order.status,),

                  ),
                );
              });
        },
      ),

    );
  }
}
