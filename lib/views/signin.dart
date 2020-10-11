import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  final _formKey = GlobalKey<FormState>();
  String email,password;


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
        child: Container(
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (val){
                  email = val
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
