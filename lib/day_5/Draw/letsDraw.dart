import 'package:flutter/material.dart';
import 'package:osc_workshop/day_5/Draw/drawer.dart';

class letsDraw extends StatefulWidget {
  const letsDraw({Key? key}) : super(key: key);

  @override
  _letsDrawState createState() => _letsDrawState();
}

class _letsDrawState extends State<letsDraw> {
  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: scwidth,
        height: scheight / 2,
        child: CustomPaint(
          painter: drawer(),
        ),
      ),
    );
  }
}
