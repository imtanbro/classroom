import 'package:classroom/services/database.dart';
import 'package:classroom/views/create_quiz.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: Container(
        color: Colors.black,
              child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Quiz").snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot course = snapshot.data.documents[index];
                return ListTile(
                  leading: Image.network(course['quizImageURL']),
                  title: Text(course['quizTitle'],style: TextStyle(color: Colors.blue),),
                  subtitle: Text(course['quizDescription'],style: TextStyle(color: Colors.blue),),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),
    );
  }
}

// class Quiz extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Quiz"),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("Quiz").snapshots(),
//         builder: (context, snapshot) {
//           return ListView.builder(
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot course = snapshot.data.documents[index];
//               return ListTile(
//                 leading: Image.network(course['quizImageURL']),
//                 title: Text(course['quizTitle']),
//                 subtitle: Text(course['quizDescription']),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

