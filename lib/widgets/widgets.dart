import 'package:classroom/helper/constant.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(Icons.dashboard, color: kPrimaryColor),
      onPressed: () {},
    ),
    title: RichText(
        text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w900),
            children: [
          TextSpan(
            text: "School",
            style: TextStyle(color: kSecondaryColor),
          ),
          TextSpan(text: "Pool", style: TextStyle(color: kPrimaryColor))
        ])),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.exit_to_app, color: kSecondaryColor),
          onPressed: () {})
    ],
    centerTitle: true,
  );
}

Widget blueButton(BuildContext context, String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(66, 133, 244, 1),
          Color.fromRGBO(219, 68, 55, 1),
          Color.fromRGBO(244, 180, 0, 1),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    height: 50,
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}

Widget customButton(BuildContext context, String label, buttonWidth) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(66, 133, 244, 1),
          Color.fromRGBO(219, 68, 55, 1),
          Color.fromRGBO(244, 180, 0, 1),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    height: 50,
    alignment: Alignment.center,
    width: buttonWidth != null
        ? buttonWidth
        : MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}

Widget inputTextStylingForm(
    BuildContext context, String label, String errorMessage) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
      validator: (val) => val.isEmpty ? errorMessage : null,
      cursorColor: Colors.blue,
      style: TextStyle(
        color: Color.fromRGBO(244, 180, 0, 1),
        decorationColor: Color.fromRGBO(66, 133, 244, 1),
        fontSize: 20,
        // backgroundColor: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: label,
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
        return val;
      },
    ),
  );
}

Padding homeScreenBox(BuildContext context, String name, Widget _widget) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => _widget));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, kPrimaryColor.withOpacity(0.8)]),
            boxShadow: [
              BoxShadow(
                  color: kSecondaryColor.withOpacity(0.2),
                  offset: Offset(0, 5),
                  spreadRadius: 5,
                  blurRadius: 5)
            ]),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kSecondaryColor,
              fontSize: 40,
            ),
          ),
        ),
      ),
    ),
  );
}
