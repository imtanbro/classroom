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
    questionModel.question = questionSnapshot["question"];

    /// shuffling the options
    List<String> options = [
      questionSnapshot["option1"],
      questionSnapshot["option2"],
      questionSnapshot["option3"],
      questionSnapshot["option4"]
    ];
    options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = questionSnapshot["option1"];
    questionModel.answered = false;

    print(questionModel.correctOption.toLowerCase());

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
      setState(() {});
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
        color: Colors.black,
        child: Column(
          children: [
            questionsSnapshot.docs == null
                ? Container()
                : StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Quiz")
                        .doc(widget.quizID)
                        .collection("QuestionsData")
                        .snapshots(),
                    builder: (context, snapshot) {
                      return snapshot.data == null
                          ? Container()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                return QuizPlayTile(
                                  questionModel:
                                      getQuestionModelFromDatasnapshot(
                                          questionsSnapshot.docs[index]),
                                  index: index,
                                );
                              });
                    })

            // : ListView.builder(
            //     itemCount: questionsSnapshot.docs.length,
            //     itemBuilder: (context, index) {
            //       return QuizPlayTile(
            //         getQuestionModelFromDatasnapshot(
            //             questionsSnapshot.docs[index]),
            //         index,
            //       );.
            //     },
            //   ),
          ],
        ),
      ),
    );
  }
}

class QuizPlayTile extends StatefulWidget {
  // final String question, correctOption;
  // final String option1, option2, option3, option4;
  // final bool answer;
  final QuestionModel questionModel;
  final int index;

  QuizPlayTile(
      {
      // this.question,
      this.index,
      // this.answer,
      // this.correctOption,
      // this.option1,
      // this.option2,
      // this.option3,
      // this.option4,
      this.questionModel});

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
          Text(
            widget.questionModel.question,
            style: TextStyle(
              color: Color.fromRGBO(244, 180, 0, 1),
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                //correct
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctOption) {
                  optionSelected = widget.questionModel.option1;
                  widget.questionModel.answered = true;
                  _correct++;
                  _notAttempted--;
                  setState(() {});
                } else {
                  optionSelected = widget.questionModel.option1;
                  widget.questionModel.answered = true;
                  _incorrect++;
                  _notAttempted--;
                  setState(() {
                    
                  });
                }
              }
            },
            child: OptionTile(
              correctAnswer: widget.questionModel.option1,
              desc: widget.questionModel.option1,
              option: "A",
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                //correct
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctOption) {
                  optionSelected = widget.questionModel.option2;
                  widget.questionModel.answered = true;
                  _correct++;
                  _notAttempted--;
                  setState(() {});
                } else {
                  optionSelected = widget.questionModel.option2;
                  widget.questionModel.answered = true;
                  _incorrect++;
                  _notAttempted--;
                  setState(() {
                    
                  });
                }
              }
            },
                      child: OptionTile(
              correctAnswer: widget.questionModel.option1,
              desc: widget.questionModel.option2,
              option: "B",
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                //correct
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctOption) {
                  optionSelected = widget.questionModel.option3;
                  widget.questionModel.answered = true;
                  _correct++;
                  _notAttempted--;
                  setState(() {});
                } else {
                  optionSelected = widget.questionModel.option3;
                  widget.questionModel.answered = true;
                  _incorrect++;
                  _notAttempted--;
                  setState(() {
                    
                  });
                }
              }
            },
                      child: OptionTile(
              correctAnswer: widget.questionModel.option1,
              desc: widget.questionModel.option3,
              option: "C",
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                //correct
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctOption) {
                  optionSelected = widget.questionModel.option4;
                  widget.questionModel.answered = true;
                  _correct++;
                  _notAttempted--;
                  setState(() {});
                } else {
                  optionSelected = widget.questionModel.option4;
                  widget.questionModel.answered = true;
                  _incorrect++;
                  _notAttempted--;
                  setState(() {
                    
                  });
                }
              }
            },
                      child: OptionTile(
              correctAnswer: widget.questionModel.option1,
              desc: widget.questionModel.option4,
              option: "D",
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
