import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => new _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: new SplashScreen(
        seconds: 6,
        navigateAfterSeconds: LoginUI(),
        image: new Image.asset('assets/loading.gif'),
        backgroundColor: Colors.black,
        photoSize: 150.0,
        loaderColor: Colors.lightBlue[50],
      ),
    );
  }
}
