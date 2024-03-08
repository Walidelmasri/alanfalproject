import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alanfalproject/services/users.dart';
import 'package:provider/provider.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:alanfalproject/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    TextEditingController textController = TextEditingController();

    return Scaffold(

      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'My Account',
          style: GoogleFonts.changa(color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),


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
                color: Colors.white,
                child: ListTile(
                  leading:  Icon(FontAwesomeIcons.user),
                  title: Text(
                    'My Name:  ' + auth.userModel.name,
                    style: GoogleFonts.changa(
                      color: Colors.black,
                      fontSize: 18
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
              color: Colors.white,
              child: ListTile(
                leading:  Icon(FontAwesomeIcons.home),
                title: Text(
                  'My Address:  ' + auth.userModel.address,
                  style: GoogleFonts.changa(
                    color: Colors.black,
                    fontSize: 18
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
              color: Colors.white,
              child: ListTile(
                leading:  Icon(FontAwesomeIcons.phoneSquare),
                title: Text(
                  'My Phone Number:  ' + auth.userModel.phonenumber.toString(),
                  style: GoogleFonts.changa(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
//                  onTap: () => launch(website),
              ),
            ),
            RaisedButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        //this right here
                        child: Container(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Please Explain the Technical Problem',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                TextFormField(
                                  controller: textController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Explaination",
                                    icon: Icon(Icons.text_fields),
                                  ),
                                ),
                                SizedBox(
                                  width: 320.0,
                                  child: RaisedButton(
                                      onPressed: () async {
                                        var uuid = Uuid();
                                        String id = uuid.v4();
                                        await auth.createMaintananceNote(
                                          id: id,
                                          name: auth.userModel.name,
                                          note: textController.text,
                                          address: auth.userModel.address,
                                          phonenumber: auth.userModel.phonenumber,
                                          userid: auth.userModel.id
                                        );
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20.0)),
                                              //this right here
                                              child: Container(
                                                height: 200,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Maintanance Request has been sent. Our employee will contact you shortly.',
                                                        textAlign: TextAlign.center,
                                                        style: GoogleFonts.changa(fontWeight: FontWeight.bold, fontSize: 18),
                                                      ),
                                                      SizedBox(
                                                        width: 320.0,
                                                        child: RaisedButton(
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                              Navigator.pop(context);

                                                            },
                                                            child: Text(
                                                              "Ok",
                                                              style: GoogleFonts.changa(
                                                                  color: Colors.white,
                                                                  fontSize: 18),
                                                            ),
                                                            color: Colors.red),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        );


                                      },
                                      child: Text(
                                        "Send Request",
                                        style: GoogleFonts.changa(
                                          color: Colors.white,
                                          fontSize: 18,),
                                      ),
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );}
                );
              },
              color: Colors.green,
              child: Text('Request Maintanance', style: GoogleFonts.changa(
                fontSize: 18,
                color: Colors.white,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
