import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'video.dart';

myapp() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.red[400]);
  press() {
    Fluttertoast.showToast(
      msg: "This is IIEC-RISE Community",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.lightBlue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  press2() {
    Fluttertoast.showToast(
      msg: "This is Your Mentor",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.lightBlue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  var mybody = Container(
    width: double.infinity,
    height: double.infinity,
    margin: EdgeInsets.all(5),
    color: Colors.amber[300],
    child: Column(
      children: <Widget>[
        Container(
          height: 150,
          width: 350,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Card(
            color: Colors.blueGrey,
            elevation: 5,
            shadowColor: Colors.blueAccent,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () => press(),
                  child: Container(
                    height: 140,
                    width: 160,
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 160,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: Colors.purple[200],
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Specialize in Python along with Full Stack',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      RaisedButton(
                        //webserver
                        onPressed: () => launch('http://192.168.43.105'),
                        child: Text('Register'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 200,
          width: 360,
          color: Colors.blue[200],
          child: NetworkVideo(),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
              alignment: Alignment.center,
              width: 360,
              height: 140,
              child: Column(
                children: <Widget>[
                  Text(
                    'KNOW YOUR MENTOR',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Vimal Daga Sir',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => launch(
                  'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjfobLNrvzqAhW3xDgGHQDzB9MQFjAAegQIAxAB&url=https%3A%2F%2Fin.linkedin.com%2Fin%2Fvimaldaga&usg=AOvVaw21_yLRusrhY6KyghsZeaet'),
              onDoubleTap: () => press2(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://github.com/akhilesh-jain1729/flutter/raw/master/vimal_photo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(70),
                  border: Border.all(
                    color: Colors.blue[100],
                    width: 3,
                  ),
                ),
                width: 120,
                height: 120,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          " Be SPECIALIST IN PYTHON",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.red[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () =>
                launch('https://www.linkedin.com/in/akhilesh-jain-a871531ab'),
          ),
        ],
      ),
      body: mybody,
    ),
  );
}
