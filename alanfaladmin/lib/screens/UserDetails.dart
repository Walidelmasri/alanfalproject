import 'package:flutter/material.dart';
import 'package:alanfaladmin/models/user.dart';
import 'package:provider/provider.dart';
import 'package:alanfaladmin/provider/user.dart';


class UserDetails extends StatefulWidget {

  final UserModel user;

  const UserDetails({Key key, this.user}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.2,
        backgroundColor: Colors.white,
        title: Text(
          '$widget.user.name',
//          style: GoogleFonts.audiowide(color: Colors.deepOrange),


        ),
        actions: <Widget>[
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: Colors.white70,
              child: ListTile(
                leading:  Icon(Icons.person_outline),
                title: Text(
                  'My Name:  ' + widget.user.name,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
//                  onTap: () => launch(website),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: Colors.white70,
              child: ListTile(
                leading:  Icon(Icons.alternate_email),
                title: Text(
                  'My Email:  ' + widget.user.email,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
//                  onTap: () => launch(website),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: Colors.white70,
              child: ListTile(
                leading:  Icon(Icons.house),
                title: Text(
                  'My Address:  ' + widget.user.address,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
//                  onTap: () => launch(website),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: Colors.white70,
              child: ListTile(
                leading:  Icon(Icons.phone),
                title: Text(
                  'My Phone Number:  ' + widget.user.phonenumber,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
//                  onTap: () => launch(website),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

