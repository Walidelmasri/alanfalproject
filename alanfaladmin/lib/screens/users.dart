import 'package:flutter/material.dart';
import 'package:alanfaladmin/models/user.dart';
import 'package:alanfaladmin/service/user.dart';
import 'package:alanfaladmin/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:alanfaladmin/screens/usersearchscreen.dart';

class UsersScreen extends StatefulWidget {
  final UserModel user;
  const UsersScreen({Key key, this.user}) : super(key: key);


  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  TextEditingController _name = TextEditingController();
  UserServices userServices = UserServices();
  @override
  void initState() {
    super.initState();
    userServices.getUsers();
  }
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'Users Data'
        ),
        elevation: 0.2,
        backgroundColor: Colors.black,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Search User'),
                    content:
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                          hintText: "Enter the Username you want to search",
                          icon: Icon(Icons.person_outline),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "The name field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () async {
                          await userProvider.search(userName: _name.text);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => new UserSearchScreen()));
                        },
                        child: Text('Search'),
                      ),

                    ],
                  )
                );
              }
              )
        ],
      ),
      body: ListView.builder(
          itemCount: userProvider.users.length,
          itemBuilder: (_, index){
            UserModel _user = userProvider.users[index];
            return InkWell(
              onTap: (){
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => new OrderDetails(order: _order)));
//                print(orderProvider.orderModel.description);
              },
              child: ListTile(
//                leading: Text(
//                  "\$${_user.name}",
//                ),
                title: Text(_user.name),
//                subtitle: Text("\$${_order.cart.length}"),
//              subtitle: Text(DateTime.fromMillisecondsSinceEpoch(_order.createdAt).toString()),
//                trailing: Text(_order.status,),

              ),
            );
          }),
    );
  }
}
