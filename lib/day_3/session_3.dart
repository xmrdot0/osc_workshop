import 'package:flutter/material.dart';

class Session3 extends StatefulWidget {
  const Session3({Key? key}) : super(key: key);

  @override
  _Session3State createState() => _Session3State();
}

class _Session3State extends State<Session3> {
  int? _groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierLabel: "Label",
                  builder: (context) {
                    return AlertDialog(
                      content: Text("headusp"),
                      title: Text("headsdown"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("actions"))
                      ],
                    );
                  });
            },
            child: Image(
              width: 150,
              height: 150,
              fit: BoxFit.fitHeight,
              image: AssetImage(
                'assets/images/night.png',
              ),
            ),
          ),
          Text(
            'ASD',
            style: TextStyle(fontFamily: 'afont', fontSize: 20),
          ),
          ListTile(
            title: Text("Button 1"),
            leading: Radio(
              value: 0,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value as int;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Button 1"),
            leading: Radio(
              value: 1,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value as int;
                });
              },
            ),
          ),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierLabel: "Label",
                    builder: (context) {
                      return AlertDialog(
                        content: _groupValue == 0
                            ? Text("You pressed button 1")
                            : Text("2"),
                        title: Text("headsdown"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("actions"))
                        ],
                      );
                    });
              },
              child: Text("Click Me"))
        ],
      ),
    );
  }
}
