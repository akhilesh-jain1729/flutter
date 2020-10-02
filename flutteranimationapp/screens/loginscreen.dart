import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> with SingleTickerProviderStateMixin {
  Animation animation, delayedanimation, muchdelayedanimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: -1.0, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    );
    delayedanimation = Tween(begin: -1, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    muchdelayedanimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    animationController.forward();

    presslogin() {}
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Align(
              alignment: Alignment.center,
              child: Container(
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(25.0),
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  0.0, animation.value * width, 0.0),
                              child: Text(
                                "Hello     There...",
                                style: TextStyle(
                                  // fontFamily: ,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  delayedanimation.value * width, 0.0, 0.0),
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        hintText:
                                            "   Username / Registered EmailID"),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        decorationStyle:
                                            TextDecorationStyle.wavy,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintText: "   Password",
                                    ),
                                    obscureText: true,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(190, 14, 10, 0),
                                    // alignment: Alignment.centerRight,
                                    color: Colors.transparent,
                                    child: Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg: " LOGIN Successfull ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.black,
                                fontSize: 16.0,
                              );
                            },
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  -(delayedanimation.value * width), 0.0, 0.0),
                              child: Container(
                                width: 300,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 25, 0, 5),
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  0.0, muchdelayedanimation.value * width, 0.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "   Dont have an account, click the button below  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 18.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("register clicked");
                                      Navigator.pushNamed(context, "register");
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 47,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 3,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "REGISTER",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
