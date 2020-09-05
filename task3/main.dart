import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String x;

  var data;
  var mydata;
  _launchURL() async {
    const url1 =
        'https://console.firebase.google.com/u/0/project/fir-app-91c41/firestore/data~2Ftask3flutter~2FBZ9cD9AkGZU0GLRmqQ5U';
    if (await canLaunch(url1)) {
      await launch(url1);
    } else {
      throw 'Could not launch $url1';
    }
  }

  web(cmd) async {
    var url = "http://192.168.43.105/cgi-bin/api.py?input=${cmd}";
    var r = await http.get(url);
    setState(() {
      mydata = r.body;
    });
    data = FirebaseFirestore.instance.collection("task3flutter").add({
      cmd: mydata,
    });
    print(mydata);
  }

  final nameHolder = TextEditingController();
  clearTextInput() {
    nameHolder.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              title: Text(
                'Firebase App Task3',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              backgroundColor: Colors.yellow[400],
              actions: <Widget>[
                IconButton(
                  mouseCursor: SystemMouseCursors.text,
                  icon: Icon(
                    Icons.account_box,
                    color: Colors.black,
                  ),
                  onPressed: () => launch(
                      'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjfobLNrvzqAhW3xDgGHQDzB9MQFjAAegQIAxAB&url=https%3A%2F%2Fin.linkedin.com%2Fin%2Fvimaldaga&usg=AOvVaw21_yLRusrhY6KyghsZeaet'),
                ),
                IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  onPressed: () => launch(
                      'https://in.linkedin.com/in/akhilesh-jain-a871531ab?trk=people-guest_people_search-card'),
                ),
              ],
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey[300],
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.grey[800],
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 340,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://raw.githubusercontent.com/akhilesh-jain1729/flutter/master/task3/index.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(2),
                        child: Text(
                          "Instructions: Whatever you write in the command block, will be stored on google cloud database with your input and output received !!!\n",
                          style: TextStyle(
                            backgroundColor: Colors.red[100],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Card(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: nameHolder,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Enter your linux command here :",
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.keyboard),
                          ),
                          onChanged: (val) {
                            x = val;
                          },
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  web(x);
                                  _launchURL();
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Card(
                                  child: FlatButton(
                                color: Colors.grey[800],
                                onPressed: clearTextInput,
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      backgroundColor: Colors.grey[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.transparent,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: Colors.grey[800],
                                child: Text(
                                  mydata ?? "\n--- OUTPUT BELOW ---\n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

