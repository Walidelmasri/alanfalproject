//import 'package:alanfalproject/providers/auth.dart';
//import 'package:alanfalproject/pages/home.dart';
//import 'package:alanfalproject/pages/login.dart';
//import 'package:alanfalproject/pages/splash.dart';
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//
//
//
//void main() {
//  WidgetsFlutterBinding.ensureInitialized();
//
//  runApp(MultiProvider(providers: [
//    ChangeNotifierProvider.value(value: AuthProvider.initialize())
//  ],
//    child: MyApp(),));
//}
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: 'Corona Out',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: ScreensController()
//    );
//  }
//}
//
//
//class ScreensController extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final auth = Provider.of<AuthProvider>(context);
//    if(auth.status == Status.Uninitialized){
//      return Splash();
//    }else{
//      if(auth.loggedIn){
//        return Home();
//      }else {
//        return Login();
//      }
//    }
//  }
//}
//
import 'package:alanfalproject/pages/home.dart';
import 'package:alanfalproject/pages/login.dart';
import 'package:alanfalproject/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'providers/app_provider.dart';
import 'providers/product_provider.dart';
import 'providers/safewindow_provider.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase/firebase.dart';
import 'package:custom_splash/custom_splash.dart';

//import 'providers/auth.dart';
void main() async {

  Map<int, Widget> op = {1: Login(), 2: Login()};

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: AppProvider()),
    ChangeNotifierProvider.value(value: ProductProvider.initialize()),
    ChangeNotifierProvider.value(value: SafeWindowProvider.initialize()),
//    ChangeNotifierProvider.value(value: AuthProvider.initialize())


  ], child: MaterialApp(
    builder: (context, child){
      return MediaQuery(
        data: MediaQuery.maybeOf(context).copyWith(textScaleFactor: 1.0),
        child: child,
      );
    },
    debugShowCheckedModeBanner: false,

    theme: ThemeData(
        primaryColor: Colors.white,
    ),
//    home: ScreensController(),
    home: CustomSplash(
      imagePath: 'images/gif/logosplash.gif',
//      backGroundColor: Colors.deepOrange,
      // backGroundColor: Color(0xfffc6042),
      animationEffect: 'zoom-in',
      logoSize: 200,
      home: ScreensController(),
//      customFunction: duringSplash,
      duration: 6300,
      type: CustomSplashType.StaticDuration,
      outputAndHome: op,
    ),
  ),));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Login();
        break;
      case Status.Authenticated:
        return Home();
        break;
      case Status.Authenticating:
        return Login();
        break;
      case Status.Unauthenticated:
        return Login();
        break;
      default: Login();
    }
  }
}
