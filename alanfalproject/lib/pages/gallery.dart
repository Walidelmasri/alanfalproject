import 'package:flutter/material.dart';
import 'package:alanfalproject/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/widgets/gallerycard.dart';
import 'package:google_fonts/google_fonts.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Gallery',
          style: GoogleFonts.changa(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            fontSize: 30
          ),


        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 8,
        children: productProvider.alldoors
            .map((item) => GestureDetector(
          child: GalleryCard(
            product: item,
          ),
        ))
            .toList(),
      ),
    );  }
}
