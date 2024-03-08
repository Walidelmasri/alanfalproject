import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    {
      "name": "Door 1",
      "picture": "images/doortest.jpg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Door 2",
      "picture": "images/doortest.jpg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: productsOnTheCart.length,
      itemBuilder: (context, index){
         return SingleCartProduct(
           cart_prod_name: productsOnTheCart[index]["name"],
           cart_prod_picture: productsOnTheCart[index]["picture"],
           cart_prod_price: productsOnTheCart[index]["price"],
           cart_prod_size: productsOnTheCart[index]["size"],
           cart_prod_color: productsOnTheCart[index]["color"],
           cart_prod_quantity: productsOnTheCart[index]["quantity"],

         );
      },
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_quantity;

  SingleCartProduct({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_quantity,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//        leading section is the image
        leading: Image.asset(cart_prod_picture, width: 60.0, height: 100.0,),
//        title section
        title: new Text(cart_prod_name),
//        subtitle section
        subtitle: new Column(
          children: <Widget>[
//            row inside the column
            new Row(
              children: <Widget>[
//                size of product
//                Padding(
//                  padding: const EdgeInsets.all(0.0),
//                  child: new Text('Size: '),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(2.0),
//                  child: new Text(cart_prod_size,
//                  style: TextStyle(
//                    color: Colors.red,
//                  ),),
//                ),
//                color of product
                new Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 8.0, 8.0),
                  child: new Text('Color: '),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: new Text(cart_prod_color,
                    style: TextStyle(
                      color: Colors.red,
                    ),),
                ),
              ],
            ),
//            price of product
          new Container(
            alignment: Alignment.topLeft,
            child: new Text('EGP $cart_prod_price',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),),
          ),
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              new IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: (){cart_prod_quantity+1;},
                iconSize: 50.0,
              ),
              new Text('$cart_prod_quantity', style: TextStyle(
                fontSize: 30.0,
              ),),
              new IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: (){},
                  iconSize: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

