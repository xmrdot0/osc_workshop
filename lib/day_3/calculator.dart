import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  CalCulations c = new CalCulations();

  TextStyle textStyle = TextStyle(color: Colors.white);

  TextStyle textStyleGreen = TextStyle(fontSize: 30);
  TextStyle textStyleBlack = TextStyle(fontSize: 30, color: Colors.white);

  GestureDetector buildRow(color, screenWidth, screenHeight, string, style) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (color == Colors.black) {
            c.res += string;
            if (c.state == 0) {
              c.num1 = double.parse(c.res);
              print("i am num1 ${c.num1}");
            } else {
              c.num2 = double.parse(c.res);
              print("i am num2 ${c.num2} and num1 is ${c.num1}");
            }
          } else {
            setState(() {
              c.state = 1;
              c.res = "";
              print("${c.num1} and ${c.num2} ");
              if (string == '=') {
                if (c.op == '*') c.Mult();
                if (c.op == '+') c.Add();
                if (c.op == '-') c.Sub();
                if (c.op == '/') c.Div();
                if (c.op == '%') c.Mod();
                if (c.op == 'C') c.Clr();
                print("i am res ${c.res}");
                c.num1 = double.parse(c.res);
                c.state = 1;
                c.op = '';
              } else {
                c.op = string;
                print("i am op ${c.op}");
              }
            });
          }
        });
      },
      child: Container(
        width: screenWidth / 4,
        height: screenHeight * 0.13,
        color: color,
        child: Center(
          child: Text(
            "$string",
            style: style,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Calculator",
          style: textStyle,
        ),
      ),
      body: Container(
        width: screenWidth,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.24,
              child: Center(
                child: Text(
                  "${c.res}",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenHeight * 0.1),
                ),
              ),
            ),
            Container(
              width: screenWidth,
              child: Column(
                children: [
                  Row(
                    children: [
                      buildRow(Colors.green, screenWidth, screenHeight, "C",
                          textStyleGreen),
                      buildRow(Colors.green, screenWidth, screenHeight, "X",
                          textStyleGreen),
                      buildRow(Colors.green, screenWidth, screenHeight, "%",
                          textStyleGreen),
                      buildRow(Colors.green, screenWidth, screenHeight, "/",
                          textStyleGreen)
                    ],
                  ),

                  //2nd row

                  Row(
                    children: [
                      buildRow(Colors.black, screenWidth, screenHeight, '7',
                          textStyleBlack),
                      buildRow(Colors.black, screenWidth, screenHeight, '8',
                          textStyleBlack),
                      buildRow(Colors.black, screenWidth, screenHeight, '9',
                          textStyleBlack),
                      buildRow(Colors.green, screenWidth, screenHeight, '*',
                          textStyleGreen)
                    ],
                  ),
                  Row(
                    children: [
                      buildRow(Colors.black, screenWidth, screenHeight, '4',
                          textStyleBlack),
                      buildRow(Colors.black, screenWidth, screenHeight, '5',
                          textStyleBlack),
                      buildRow(Colors.black, screenWidth, screenHeight, '6',
                          textStyleBlack),
                      buildRow(Colors.green, screenWidth, screenHeight, '-',
                          textStyleGreen)
                    ],
                  ),
                  Row(
                    children: [
                      buildRow(Colors.black, screenWidth, screenHeight, '1',
                          textStyleBlack),
                      buildRow(Colors.black, screenWidth, screenHeight, '2',
                          textStyleBlack),
                      buildRow(Colors.black, screenWidth, screenHeight, '3',
                          textStyleBlack),
                      buildRow(Colors.green, screenWidth, screenHeight, '+',
                          textStyleGreen)
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildRow(Colors.black, screenWidth, screenHeight, '7',
                              textStyleBlack),
                          buildRow(Colors.green, screenWidth, screenHeight, '=',
                              textStyleGreen),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CalCulations {
  double num1 = 0;
  double num2 = 0;
  String op = '';
  String res = "";
  int state = 0;

  Add() {
    res = (num1 + num2).toString();
  }

  Sub() {
    res = (num1 - num2).toString();
  }

  Div() {
    res = (num1 / num2).toString();
  }

  Mult() {
    res = (num1 * num2).toString();
  }

  Mod() {
    res = (num1 % num2).toString();
  }

  Clr() {
    res = '';
    num1 = 0;
    num2 = 0;
    op = '';
    state = 0;
  }
}
