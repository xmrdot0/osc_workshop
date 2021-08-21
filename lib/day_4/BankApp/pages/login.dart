import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osc_workshop/day_4/BankApp/Database/DatabaseHelper.dart';
import 'package:osc_workshop/day_4/BankApp/Models/Account.dart';
import 'package:osc_workshop/day_4/BankApp/pages/BankMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  DatabaseHelper _databaseHelper = DatabaseHelper();
  TextEditingController _bankNum = TextEditingController();
  TextEditingController _username = TextEditingController();

  TextEditingController _password = TextEditingController();

  late SharedPreferences _preferences;

  saveData() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setStringList('accountData', [_bankNum.text, _password.text]);
  }

  loadData() async {
    _preferences = await SharedPreferences.getInstance();
    List? accountData = _preferences.getStringList('accountData');
    setState(() {
      _bankNum.text = accountData![0];
      _password.text = accountData[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    loadData();
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
                "Sign In",
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
                          controller: _bankNum,
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
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Data processing")));
                    _databaseHelper
                        .getAccount(int.parse(_bankNum.text), _password.text)
                        .then((accountList) async {
                      if (accountList.isEmpty) {
                        // Login failed
                        print("isEmpty");
                      } else {
                        print(accountList);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login Sucess")));
                        Map m = accountList[0];
                        Account currentAccount = Account(
                            username: m['username'],
                            accountNum: m['accountNum'],
                            password: m['password'],
                            name: m['name'],
                            amount: m['amount']);
                      }
                      await saveData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Menu()));
                    });
                  }
                },
                child: Text("Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
