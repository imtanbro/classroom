import 'package:classroom/helper/constant.dart';
import 'package:flutter/material.dart';

class Assignments extends StatefulWidget {
  @override
  _AssignmentsState createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: kSecondaryColor.withOpacity(0.2),
                    style: BorderStyle.solid,
                    width: 3.0),
                color: Colors.white),
          ),
        ));
      },
    ));
  }
}
