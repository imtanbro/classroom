import 'package:classroom/helper/constant.dart';
import 'package:classroom/views/quiz/Quiz.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSecondaryColor.withOpacity(0.01),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quiz()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 48,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, kPrimaryColor]),
                        boxShadow: [
                          BoxShadow(
                              color: kSecondaryColor.withOpacity(0.2),
                              offset: Offset(0, 5),
                              spreadRadius: 5,
                              blurRadius: 5)
                        ]),
                    child: Center(
                      child: Text(
                        "Quiz",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
