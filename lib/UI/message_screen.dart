import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserMessage extends StatelessWidget {
  String? userID;
  UserMessage({super.key, @required this.userID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Text("Welcome!", style: TextStyle(fontSize: 30)),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  userID.toString(),
                  style: const TextStyle(fontSize: 20),
                ))
          ])),
    ))));
  }
}
