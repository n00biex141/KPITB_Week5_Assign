import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:week5_assignment/Functions/login_func.dart';
import 'package:week5_assignment/UI/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isTextVis = false;
  Icon passIcon = const Icon(Icons.visibility_off);

  bool userTextVis = false;
  bool passTextVis = false;

  bool isKeepme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(children: const <Widget>[
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.account_circle,
                        size: 150,
                        color: Colors.blue,
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("Login Account Test Application",
                              style: TextStyle(fontSize: 15)))),
                ])),
            TextField(
              onChanged: ((value) => setState(() {
                    if (value.isNotEmpty) {
                      userTextVis = true;
                    } else {
                      userTextVis = false;
                    }
                  })),
              controller: idController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username or Email',
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                onChanged: ((value) => setState(() {
                      if (value.isNotEmpty) {
                        passTextVis = true;
                      } else {
                        passTextVis = false;
                      }
                    })),
                obscureText: !isTextVis,
                controller: passwordController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () => setState(() {
                              isTextVis = !isTextVis;
                              if (!isTextVis) {
                                passIcon = const Icon(Icons.visibility_off);
                              } else {
                                passIcon = const Icon(Icons.remove_red_eye);
                              }
                            }),
                        icon: passIcon)),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20), child: Divider()),
            Row(children: <Widget>[
              Row(children: <Widget>[
                const Text("Keep me logged in"),
                Checkbox(
                    value: isKeepme,
                    onChanged: ((value) => setState(() {
                          isKeepme = value!;
                        })))
              ]),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password'),
              )
            ]),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 200,
                        height: 40,
                        child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: MaterialButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                textColor: Colors.white,
                                color: (userTextVis && passTextVis)
                                    ? Colors.blueAccent
                                    : Colors.grey,
                                onPressed: () => ((idController.text.isEmpty) ==
                                            false &&
                                        (passwordController.text.isEmpty) ==
                                            false)
                                    ? loginFoo(context, idController.text)
                                    : Fluttertoast.showToast(
                                        msg:
                                            "Please fill the entries before proceeding",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0),
                                child: const Text("Login",
                                    style: TextStyle(fontSize: 16))))))),
            const Divider(),
            Row(children: <Widget>[
              const Text("Don't have an account!"),
              const Spacer(),
              TextButton(
                onPressed: () {
                  var route =
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const RegisterScreen();
                  });
                  Navigator.of(context).push(route);
                },
                child: const Text('Register an account'),
              )
            ]),
          ],
        ),
      ),
    )));
  }
}
