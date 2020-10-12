import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 9),
          child: appBar(context),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                print("User Profile");
              },
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
      validator: (val) => val.isEmpty ? "Enter URL" : null,
      cursorColor: Colors.blue,
      style: TextStyle(
        color: Color.fromRGBO(244, 180, 0, 1),
        decorationColor: Color.fromRGBO(66, 133, 244, 1),
        fontSize: 20,
        // backgroundColor: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: "Quiz Image URL",
        labelStyle: TextStyle(
            fontSize: 25,
            color: Colors.blue,
        ),
        // fillColor: Colors.white,
        // filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        quizImageUrl = val;
      },
    ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
