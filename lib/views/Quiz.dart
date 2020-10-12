import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
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
              child: Icon(
                Icons.person
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: Container(
        child: Column(children: [

        ],),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        ),
    );
  }
}
