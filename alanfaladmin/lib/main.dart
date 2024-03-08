import 'package:flutter/material.dart';
import 'package:alanfaladmin/screens/admin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:alanfaladmin/provider/order.dart';
import 'package:alanfaladmin/provider/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: OrderProvider.initialize()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Admin(),
    ),
  ));
}