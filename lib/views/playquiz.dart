import 'package:classroom/models/questionModel.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/widgets/quizplaywidget.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlayQuiz extends StatefulWidget {
  final String quizID;
  PlayQuiz(this.quizID);
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int _total = 0, _correct = 0, _incorrect = 0, _notAttempted = 0;

class _PlayQuizState extends State<PlayQuiz> {
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionsSnapshot;

  QuestionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = new QuestionModel();
    questionModel.question = questionsSnapshot.data["question"];
    // questionModel.question = FirebaseFirestore.instance.collection("Quiz").doc(quizID).collection("QuestionsData")["Question"];

    List<String> options = [
      questionsSnapshot.data["option1"],
      questionsSnapshot.data["option2"],
      questionsSnapshot.data["option3"],
      questionsSnapshot.data["option4"],
    ];

    options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = questionsSnapshot.data["option1"];
    questionModel.answer = false;

    return questionModel;
  }

  @override
  void initState() {
    print("${widget.quizID}");
    databaseService.getQuizData(widget.quizID).then((val) {
      questionsSnapshot = val;
      _notAttempted = 0;
      _correct = 0;
      _incorrect = 0;
      _total = questionsSnapshot.docs.length;

      print("$_total this is total");
      setState(() {});.
    });
    super.initState();
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
      body: Container(
        child: Column(
          children: [
            questionsSnapshot.docs == null
                ? Container()
                : ListView.builder(
                    itemCount: questionsSnapshot.docs.length,
                    itemBuilder: (context, index) {
                      return QuizPlayTile(
                        getQuestionModelFromDatasnapshot(
                            questionsSnapshot.docs[index]),
                            index,
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}

class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  QuizPlayTile(this.questionModel, this.index);

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.questionModel.question),
          SizedBox(
            height: 4,
          ),
          OptionTile(
            correctAnswer: widget.questionModel.option1,
            desc: widget.questionModel.option1,
            option: "A",
            optionSelected: optionSelected,
          ),
          SizedBox(
            height: 4,
          ),
          OptionTile(
            correctAnswer: widget.questionModel.option1,
            desc: widget.questionModel.option2,
            option: "B",
            optionSelected: optionSelected,
          ),
          SizedBox(
            height: 4,
          ),
          OptionTile(
            correctAnswer: widget.questionModel.option1,
            desc: widget.questionModel.option3,
            option: "C",
            optionSelected: optionSelected,
          ),
          SizedBox(
            height: 4,
          ),
          OptionTile(
            correctAnswer: widget.questionModel.option1,
            desc: widget.questionModel.option4,
            option: "D",
            optionSelected: optionSelected,
          ),
        ],
      ),
    );
  }
}
