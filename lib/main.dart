import 'package:flutter/material.dart';
import 'package:osc_workshop/day_1/session.dart';
import 'package:osc_workshop/day_2/assignment_2.dart';
import 'package:osc_workshop/day_3/calculator.dart';
import 'package:osc_workshop/day_3/session_3.dart';
import 'package:osc_workshop/day_5/Draw/letsDraw.dart';
import 'package:osc_workshop/day_5/assignment_socialmedia_app/View/register.dart';
import 'package:osc_workshop/day_6/Facebook/Pages/LoginPage.dart';
import 'day_1/assignment_1.dart';
import 'day_2/session_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    print('$scheight $scwidth');
    return MaterialApp(
      home: SignUp(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> namesList = [
    'Session 1',
    'Assignment 1',
    'Session 2',
    'Assignment 2',
    'Session 3'
  ];
  List<Widget> screensList = [
    Session1(),
    Assignment1(),
    Session2(),
    Assignment2(),
    Session3()
  ];

  var listOfScreens = {
    'n': ['Session 1', 'Assignment 1', 'Session 2', 'Assignment 2'],
    's': [Session1(), Assignment1(), Session2(), Assignment2()]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OSC Workshop"),
      ),
      body: ListView.builder(
          itemCount: namesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Center(child: Text(namesList[index])),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => screensList[index]));
                  },
                )
              ],
            );
          }),
    );
  }
}
