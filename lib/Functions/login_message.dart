import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void loginMessage(BuildContext context, String message, bool isDanger) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: isDanger ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
