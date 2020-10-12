import 'package:classroom/services/database.dart';
import 'package:classroom/views/questionadd.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription, quizId;
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;

  hostQuiz() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImageURL": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDescription": quizDescription,
      };

      databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddQuestion()));
        });
      });
    }
  }

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
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.5),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) => val.isEmpty ? "Enter URL" : null,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Quiz Image URL",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                          // fillColor: Colors.white,
                          // filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onChanged: (val) {
                          quizImageUrl = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Quiz Title" : null,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Quiz Title",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                          // fillColor: Colors.white,
                          // filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onChanged: (val) {
                          quizTitle = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Description" : null,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Quiz Description",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                          // fillColor: Colors.white,
                          // filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onChanged: (val) {
                          quizDescription = val;
                        },
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          hostQuiz();
                        },
                        child: blueButton(context, "Create Quiz"),
                      ),
                      
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
