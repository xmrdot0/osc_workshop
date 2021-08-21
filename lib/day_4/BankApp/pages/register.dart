import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osc_workshop/day_4/BankApp/Database/DatabaseHelper.dart';
import 'package:osc_workshop/day_4/BankApp/Models/Account.dart';
import 'package:osc_workshop/day_4/BankApp/pages/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  late DatabaseHelper _databaseHelper;
  TextEditingController _bankNum = TextEditingController();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _amount = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: scheight * 0.2, left: scwidth * 0.05),
        child: Container(
          width: scwidth * 0.9,
          height: scheight * 0.5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.indigo, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sign up",
                style: TextStyle(color: Colors.red, fontSize: 33),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      width: scwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.indigo, width: 1)),
                      child: Padding(
                        padding: EdgeInsets.only(left: scwidth * 0.02),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "username"),
                          validator: (val) {
                            if (val!.isEmpty == true) {
                              return "please enter the username";
                            }
                          },
                          controller: _username,
                        ),
                      ),
                    ),
                    Container(
                      width: scwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.indigo, width: 1)),
                      child: Padding(
                        padding: EdgeInsets.only(left: scwidth * 0.02),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "name"),
                          validator: (val) {
                            if (val!.isEmpty == true) {
                              return "please enter the name";
                            }
                          },
                          controller: _name,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scheight * 0.01,
                    ),
                    Container(
                      width: scwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.indigo, width: 1)),
                      child: Padding(
                        padding: EdgeInsets.only(left: scwidth * 0.02),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "password"),
                          validator: (val) {
                            if (val!.isEmpty == true) {
                              return "please enter the password";
                            }
                          },
                          controller: _password,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scheight * 0.01,
                    ),
                    Container(
                      width: scwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.indigo, width: 1)),
                      child: Padding(
                        padding: EdgeInsets.only(left: scwidth * 0.02),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "moneyAmount"),
                          validator: (val) {
                            if (val!.isEmpty == true) {
                              return "please enter the moneyAmount";
                            }
                          },
                          controller: _amount,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Data processing")));
                    Account newAccount = Account(
                        name: _name.text,
                        password: _password.text,
                        username: _username.text,
                        amount: double.parse(_amount.text));
                    _databaseHelper.createAccount(newAccount).then((value) {
                      print(value);
                      _bankNum.text = value.toString();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    });
                  }
                },
                child: Text("Sign up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
