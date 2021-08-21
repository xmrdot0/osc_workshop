import 'package:flutter/material.dart';
import 'package:osc_workshop/day_5/Constants/styles.dart';
import 'package:osc_workshop/day_5/assignment_socialmedia_app/Database/DatabaseHelper.dart';
import 'package:osc_workshop/day_5/assignment_socialmedia_app/Models/account.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  late DatabaseHelper _databaseHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;

    TextEditingController _email = TextEditingController();
    TextEditingController _userName = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Signup",
                style: headerStyle,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(scHeight * 0.04),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty == true)
                              return 'Please enter your email';
                          },
                          controller: _email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: const OutlineInputBorder(
                                borderSide: const BorderSide()),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(scHeight * 0.04),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty == true)
                              return 'Please enter your username';
                          },
                          controller: _userName,
                          decoration: InputDecoration(
                              labelText: 'Username',
                              border: const OutlineInputBorder(
                                  borderSide: const BorderSide())),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(scHeight * 0.04),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty == true)
                              return 'Please enter your password';
                          },
                          controller: _password,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              border: const OutlineInputBorder(
                                  borderSide: const BorderSide())),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Data processing")));
                            Account newAccount = Account(
                                userName: _userName.text,
                                password: _password.text,
                                email: _email.text);
                            _databaseHelper
                                .createAccount(newAccount)
                                .then((value) {
                              print(value);
                              newAccount.id = value;
                            });
                          }
                        },
                        child: Text("Sign Up"),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
