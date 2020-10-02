import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';
import 'screens/splashscreen.dart';
import 'screens/registerscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "splash": (context) => MySplash(),
        "register": (context) => RegisterUI(),
        "login": (context) => LoginUI(),
      },
    );
  }
}
