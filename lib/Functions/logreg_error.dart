import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String logregError(String message) {
  switch (message) {
    case "user-not-found":
      return message = "User Not Found!";

    case "invalid-email":
      return message = "Invalid Email!";

    case "unknown":
      return message = "Please enter Email and Password!";

    case "wrong-password":
      return message = "Incorrect Password!";

    case "too-many-requests":
      return message = "Too many Resquests!";

    case "network-request-failed":
      return message = "No Internet Found!";

    default:
      return message;
  }
}

Future<bool?> errorMessage(BuildContext context, String message) {
  message = logregError(message);
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
