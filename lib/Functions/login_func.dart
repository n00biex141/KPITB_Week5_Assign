import 'package:flutter/material.dart';

import 'package:week5_assignment/UI/message_screen.dart';

void loginFoo(BuildContext context, String userID) {
  {
    var route = MaterialPageRoute(builder: (BuildContext context) {
      return const UserMessage();
    });
    Navigator.of(context).push(route);
  }
}
