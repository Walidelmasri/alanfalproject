import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alanfalproject/pages/login.dart';
import 'package:page_transition/page_transition.dart';


class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 6);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
         PageTransition(type: PageTransitionType.bottomToTop, alignment: Alignment.bottomCenter, child: Login() ));
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
//          new Column(
//            mainAxisAlignment: MainAxisAlignment.end,
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(bottom: 30.0),
//                child: new Image.asset(
//                  'assets/images/powered_by.png',
//                  height: 25.0,
//                  fit: BoxFit.scaleDown,
//                ),
//              )
//            ],
//          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/gif/logosplash.gif',
                width: animation.value * 450,
                height: animation.value * 450,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
