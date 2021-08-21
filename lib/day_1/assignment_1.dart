import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({Key? key}) : super(key: key);

  @override
  _Assignment1State createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1> {
  int? number = 0;
  TextStyle? textStyle = TextStyle(fontSize: 20, color: Colors.white);

  void updateNumber(x) {
    setState(() {
      number = x;
    });
  }

  TextButton createBtn(int givenNumber) {
    int currentNumber = givenNumber;
    return TextButton(
        onPressed: () {
          updateNumber(currentNumber);
        },
        child: Container(
            height: 75,
            width: 75,
            color: Colors.red,
            child: Center(child: Text('$currentNumber', style: textStyle))));
  }

  Row rowOfNums(num1, num2, num3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [createBtn(num1), createBtn(num2), createBtn(num3)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(
        '$number',
        style: TextStyle(
            fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      rowOfNums(1, 2, 3),
      rowOfNums(4, 5, 6),
      rowOfNums(7, 8, 9),
    ]));
  }
}
