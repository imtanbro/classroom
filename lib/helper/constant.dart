import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String USERLOGGEDINKEY = "UserLoggedInKey";

  static saveUserLoggedInDetails({@required bool isloggedin}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(USERLOGGEDINKEY, isloggedin);
  }

  static Future<bool> getUserLoggedInDetails({bool isloggedin}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(USERLOGGEDINKEY);

  }

}
