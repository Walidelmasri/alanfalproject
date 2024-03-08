import 'package:flutter/material.dart';
import 'package:alanfaladmin/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:alanfaladmin/models/user.dart';
import 'package:alanfaladmin/screens/UserDetails.dart';

class UserSearchScreen extends StatefulWidget {
  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: new AppBar(
        title: Text('Search Results'),
      ),
      body: userProvider.usersSearched.length < 1 ? Column(
        children: <Widget>[
          Center(
            child: Text("No Users Found"),
          )
        ],
      ) : ListView.builder(
        itemCount: userProvider.usersSearched.length,
        itemBuilder: (_,index){
          UserModel userModel = userProvider.usersSearched[index];
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDetails(user: userModel,)));
            },
            child: ListTile(
              title: Text(userModel.name),
            ),
          );
        },
      )
    );
  }
}
