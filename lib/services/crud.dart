import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CRUD extends StatefulWidget {
  @override
  _CRUDState createState() => _CRUDState();
}

class _CRUDState extends State<CRUD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        
      ),
    );
  }
}