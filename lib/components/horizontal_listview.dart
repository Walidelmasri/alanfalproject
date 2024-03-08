import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imglocation: 'images/cats/tshirt.png',
            imgcaption: 'Door',
          ),
          Category(
            imglocation: 'images/cats/dress.png',
            imgcaption: 'Window',
          ),
          Category(
            imglocation: 'images/cats/jeans.png',
            imgcaption: 'Roof',
          ),

        ],
      ),
    );
  }
}

class Category extends StatelessWidget {

  final String imglocation;
  final String imgcaption;

  Category({this.imglocation, this.imgcaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(

        onTap: () {},
        child: Container(
          width: 140.0,
          height: 100.0,
          child: ListTile(
            title: Image.asset(
              imglocation,
              height: 100.0,

            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(imgcaption,),
              ),
            )
          ),
        ),
      ),
    );
  }
}
