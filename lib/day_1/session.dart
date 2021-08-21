import 'package:flutter/material.dart';

class Session1 extends StatefulWidget {
  const Session1({Key? key}) : super(key: key);

  @override
  _Session1State createState() => _Session1State();
}

class _Session1State extends State<Session1> {
  Color? backgroundColor = Colors.white;
  void updateColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: OutlinedButton(
                    child: Container(),
                    onPressed: () {
                      updateColor(Colors.red);
                    },
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                  child: OutlinedButton(
                    child: Container(),
                    onPressed: () {
                      updateColor(Colors.black);
                    },
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.purple,
                  child: OutlinedButton(
                    child: Container(),
                    onPressed: () {
                      updateColor(Colors.purple);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateColor(Colors.white);
        },
      ),
    );
  }
}

class row2 extends Row {}

Widget row = Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: OutlinedButton(
        child: Container(),
        onPressed: () {},
      ),
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: OutlinedButton(
        child: Container(),
        onPressed: () {},
      ),
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: OutlinedButton(
        child: Container(),
        onPressed: () {},
      ),
    ),
  ],
);

class row1 extends StatefulWidget {
  const row1({Key? key}) : super(key: key);

  @override
  _row1State createState() => _row1State();
}

class _row1State extends State<row1> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
