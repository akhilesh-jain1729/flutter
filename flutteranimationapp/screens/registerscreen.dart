import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterUI extends StatefulWidget {
  @override
  _RegisterUIState createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI>
    with SingleTickerProviderStateMixin {
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
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Transform(
                            transform: Matrix4.translationValues(
                                0.0, animation.value * width, 0.0),
                            child: Text(
                              "Sign",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Transform(
                            transform: Matrix4.translationValues(
                                0.0, animation.value * width, 0.0),
                            child: Text(
                              "Up.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  delayedanimation.value * width, 0.0, 0.0),
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                        hintText: "   Enter your Email"),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "   Set your Username",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                        hintText: "   Set Your Password"),
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg: "Registered Successfull",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.black,
                                fontSize: 16.0,
                              );
                              print("register clicked");
                            },
                            child: Transform(
                              transform: Matrix4.translationValues(
                                  -(delayedanimation.value * width), 0.0, 0.0),
                              child: Container(
                                width: 250,
                                height: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 8,
                                  ),
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "REGISTER",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
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
                                    "   Already have an account, you can login from below  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 18.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("login button clicked");
                                      Navigator.pushNamed(context, "login");
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Login Here",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
