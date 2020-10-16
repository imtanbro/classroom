import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String uSERLOGGEDINKEY = "UserLoggedInKey";

  static saveUserLoggedInDetails({@required bool isloggedin}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(uSERLOGGEDINKEY, isloggedin);
  }

  static Future<bool> getUserLoggedInDetails({bool isloggedin}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(uSERLOGGEDINKEY);
  }
}

// enum AuthStatus { notLoggedIn, loggedIn }

// class Root extends StatefulWidget {
//   AuthStatus _authStatus = AuthStatus.notLoggedIn;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }

//   @override
//   _RootState createState() => _RootState();
// }

// class _RootState extends State<Root> {
//   @override
//   Widget build(BuildContext context) {
//     Widget retVal;

//     switch (widget._authStatus) {
//       case AuthStatus.notLoggedIn:
//         retVal = SignIn();
//         break;
//       case AuthStatus.loggedIn:
//         retVal = Home();
//         break;
//       default:
//     }
//     return retVal;
//   }
// }
