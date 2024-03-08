import 'package:flutter/material.dart';
import 'package:alanfalproject/pages/product_details.dart';


class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;

  Single_prod({
    this.prod_name,
    this.prod_picture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[350],
                blurRadius:
                10.0, // has the effect of softening the shadow
              )
            ],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(40),
            child: InkWell(
              onTap: () {},
              child: GridTile(
                  footer: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(prod_name, style: TextStyle(fontSize: 18, color: Colors.black),),

                        ],
                      )
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )
      ),
    );
  }
}