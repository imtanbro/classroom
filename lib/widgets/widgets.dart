import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  
  return Center(
    child: RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 30,
          ),
        children: <TextSpan>[
          TextSpan(text: 'G', style: TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(66, 133, 244, 1))),
          TextSpan(text: 'o', style: TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(219, 68, 55, 1))),
          TextSpan(text: 'o', style: TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(244, 180, 0, 1))),
          TextSpan(text: 'g', style: TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(66, 133, 244,1))),
          TextSpan(text: 'l', style: TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(15, 157, 88, 1))),
          TextSpan(text: 'e', style: TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(219, 68, 55, 1))),
          TextSpan(text: 'K', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(244, 180, 0, 1))),
          TextSpan(text: 'a', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(66, 133, 244, 1))),
          TextSpan(text: 'r', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(219, 68, 55, 1))),
        ],
      ),
    ),
  );
}
