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


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: AppProvider()),
    ChangeNotifierProvider.value(value: ProductProvider.initialize()),

  ], child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.white
    ),
    home: ScreensController(),
  ),));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return Home();
      default: return Login();
    }
  }
}
