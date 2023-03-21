
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../globals.dart' as globals;

class MessageHelper {
  static void showMessage(BuildContext context,String msg)
  {
    var snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static bool isLoggedIn()
  {
    return false;
  }
  static void goToLogin(BuildContext context)
  {

  }
}
