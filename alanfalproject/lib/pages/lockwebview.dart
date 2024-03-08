import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class LockPage extends StatefulWidget {
  @override
  _LockPageState createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Open Your Door',
          style: GoogleFonts.changa(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,

          ),
        ),

      ),
      body: WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
