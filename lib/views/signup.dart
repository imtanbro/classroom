import 'package:classroom/views/signin.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String email, password, name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.white,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Name" : null;
                },
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (val) {
                  name = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Email" : null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Password" : null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  print("Clicked on Sign UP Gradient Button");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(66, 133, 244, 1),
                        Color.fromRGBO(219, 68, 55, 1),
                        Color.fromRGBO(244, 180, 0, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 50,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 48,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                        print("Clicked on Sign IN Already have account");
                      },
                      child: Text(
                        "Already have an Account?",
                        style: TextStyle(fontSize: 15),
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                        print("Clicked on Sign IN");
                      },
                      child: Text(
                        " Sign In",
                        style: TextStyle(
                            fontSize: 15, decoration: TextDecoration.underline),
                      ))
                ],
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}