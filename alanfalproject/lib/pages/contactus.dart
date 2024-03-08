import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final String websiteText = 'Visit Our Website';
  final String website = 'http://www.anfalegypt.net/en/';
  final String telText = 'Call Us Now!';
  final String telNumber = 'tel:0020222610260';
  final String fbText = 'Visit Our Facebook Page';
  final String fbPageUrl = 'http://fb.me/safetydoor';
  final String msngrText = 'Contact Us on Messenger';
  final String msngrUrl = "http://m.me/safetydoor";
  final String instaText = 'Visit Instagram Page';
  final String instaUrl = 'https://www.instagram.com/anfaldoor/';
  final String showroomUrl = 'https://www.google.com/maps/uv?pb=!1s0x14583fd546402229%3A0xef649c47cd2b4af8!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPXVUkqqz1VCROdmW31r1YzKKqtwYlDWhROGL7E%3Dw172-h174-n-k-no!5sal%20anfal%20security%20doors%20showroom%20-%20Google%20Search!15sCgIgARICCAI&imagekey=!1e10!2sAF1QipMn-p-9X9IDmYasE53i_mXZgDGqRIZMkdyDPCpq&hl=en#';
  final String showroomTxt = 'Visit our Showroom Online';
  final String locationTxt = 'View our Location';
  final String locationUrl = 'https://www.google.com/search?q=al%20anfal%20security%20doors%20showroom&rlz=1C5CHFA_enMY846MY846&oq=alanfal+security+doors+showroom&aqs=chrome..69i57.6899j0j7&sourceid=chrome&ie=UTF-8&tbs=lrf:!1m4!1u3!2m2!3m1!1e1!1m4!1u2!2m2!2m1!1e1!2m1!1e2!2m1!1e3!3sIAE,lf:1,lf_ui:2&tbm=lcl&sxsrf=ALeKk02nAqZczqVVSOzUxv7AxxvdiGkaKg:1609859532601&rflfq=1&num=10&rldimm=17250084304934619896&lqi=CiBhbCBhbmZhbCBzZWN1cml0eSBkb29ycyBzaG93cm9vbVpECiBhbCBhbmZhbCBzZWN1cml0eSBkb29ycyBzaG93cm9vbSIgYWwgYW5mYWwgc2VjdXJpdHkgZG9vcnMgc2hvd3Jvb20&ved=2ahUKEwjrptCMioXuAhX1snEKHcv_DokQvS4wAXoECAQQOQ&rlst=f#rlfi=hd:;si:4003334320003552570,l,CiBhbCBhbmZhbCBzZWN1cml0eSBkb29ycyBzaG93cm9vbRlkdqav3XU7fFpECiBhbCBhbmZhbCBzZWN1cml0eSBkb29ycyBzaG93cm9vbSIgYWwgYW5mYWwgc2VjdXJpdHkgZG9vcnMgc2hvd3Jvb20;mv:[[30.077421099999995,31.359537599999996],[30.053197599999997,31.3034099]]';

  _launchCaller() async {
    const url = "tel:00201016970802";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.deepOrange,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Contact Us',
            style: GoogleFonts.changa(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,

            ),


          ),

        ),
        body: SingleChildScrollView(

            child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DrawerHeader(
                    child: Container(
                      height: 142,
                      width: MediaQuery.maybeOf(context).size.width,
                      child: Image.asset(
                        "images/logo.png",
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
//                  Divider(
//                    color: Colors.deepOrange,
//                    thickness: 4,
//                    indent: 50.0,
//                    endIndent: 50.0,
//                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Visibility(
                    visible: website != null,
                    child: Card(
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
                        leading:  FaIcon(FontAwesomeIcons.firefoxBrowser),
                        title: Text(
                          websiteText ?? 'Website',
                          style: GoogleFonts.changa(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () => launch(website),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: telNumber != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.lightGreen,
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.phone),
                        title: Text(
                          telText ?? 'Phone',
                          style: GoogleFonts.changa(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () => launch(telNumber),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: fbPageUrl != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.blueAccent,
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.facebook),
                        title: Text(
                          fbText ?? 'Facebook',
                          style: GoogleFonts.changa(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () => launch(fbPageUrl),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: msngrUrl != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.blueAccent,
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.facebookMessenger),
                        title: Text(
                          msngrText ?? 'Messenger',
                          style: GoogleFonts.changa(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () => launch(msngrUrl),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: instaUrl != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.purple,
                      child: ListTile(
                        leading:  FaIcon(FontAwesomeIcons.instagram),
                        title: Text(
                          instaText ?? 'Instagram',
                          style: GoogleFonts.changa(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () => launch(instaUrl),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: showroomUrl != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.deepOrange,
                      child: ListTile(
                        leading:  FaIcon(FontAwesomeIcons.map),
                        title: Text(
                          showroomTxt ?? 'Instagram',
                          style: GoogleFonts.changa(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () => launch(showroomUrl),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: locationUrl != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.deepOrange,
                      child: ListTile(
                        leading:  FaIcon(FontAwesomeIcons.mapMarked),
                        title: Text(
                          locationTxt ?? 'Location',
                          style: GoogleFonts.changa(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () => launch(locationUrl),
                      ),
                    ),
                  ),

                ]
            )
        ),
      );

  }
}
