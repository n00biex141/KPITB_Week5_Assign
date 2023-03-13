import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserMessage extends StatelessWidget {
  const UserMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
                  user!.email!,
                  style: const TextStyle(fontSize: 20),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: 40,
                    width: 100,
                    child: MaterialButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        textColor: Colors.white,
                        color: Colors.blueAccent,
                        onPressed: () => FirebaseAuth.instance.signOut(),
                        child: const Text("Log out",
                            style: TextStyle(fontSize: 16))))),
          ])),
    ))));
  }
}
