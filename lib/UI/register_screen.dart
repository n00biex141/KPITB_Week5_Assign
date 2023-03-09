import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:week5_assignment/Functions/login_message.dart';
import 'package:week5_assignment/UI/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confpassController = TextEditingController();

  bool fnameVis = false, emailVis = false, passVis = false, cpassVis = false;
  bool istermAccept = false;

  bool ispassTextVis = false;
  Icon passIcon = const Icon(Icons.visibility_off);

  bool iscpassTextVis = false;
  Icon cpassIcon = const Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(children: const <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.blue,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("Register a new Account",
                              style: TextStyle(fontSize: 15)))),
                ])),
            TextField(
              onChanged: ((value) => setState(() {
                    if (value.isNotEmpty) {
                      fnameVis = true;
                    } else {
                      fnameVis = false;
                    }
                  })),
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  onChanged: ((value) => setState(() {
                        if (value.isNotEmpty) {
                          emailVis = true;
                        } else {
                          emailVis = false;
                        }
                      })),
                  controller: idController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username or Email',
                    prefixIcon: Icon(Icons.mail),
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                onChanged: ((value) => setState(() {
                      if (value.isNotEmpty) {
                        passVis = true;
                      } else {
                        passVis = false;
                      }
                    })),
                obscureText: !ispassTextVis,
                controller: passwordController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () => setState(() {
                              ispassTextVis = !ispassTextVis;
                              if (!ispassTextVis) {
                                passIcon = const Icon(Icons.visibility_off);
                              } else {
                                passIcon = const Icon(Icons.remove_red_eye);
                              }
                            }),
                        icon: passIcon)),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                onChanged: ((value) => setState(() {
                      if (value.isNotEmpty) {
                        cpassVis = true;
                      } else {
                        cpassVis = false;
                      }
                    })),
                obscureText: !iscpassTextVis,
                controller: confpassController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () => setState(() {
                              iscpassTextVis = !iscpassTextVis;
                              if (!iscpassTextVis) {
                                cpassIcon = const Icon(Icons.visibility_off);
                              } else {
                                cpassIcon = const Icon(Icons.remove_red_eye);
                              }
                            }),
                        icon: cpassIcon)),
              ),
            ),
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: istermAccept,
                      onChanged: ((value) => setState(() {
                            istermAccept = value!;
                          }))),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            const Text("I accept the"),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Terms of Use'),
                            ),
                            const Text("&"),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Privacy Policy')),
                            const Text("of this Test Application")
                          ]))
                ]),
            const Padding(padding: EdgeInsets.only(top: 5), child: Divider()),
            Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                                color: (fnameVis &&
                                        emailVis &&
                                        passVis &&
                                        cpassVis &&
                                        istermAccept)
                                    ? Colors.blueAccent
                                    : Colors.grey,
                                onPressed: () => (fnameVis &&
                                        emailVis &&
                                        passVis &&
                                        cpassVis)
                                    ? (fnameVis &&
                                            emailVis &&
                                            passVis &&
                                            cpassVis &&
                                            istermAccept)
                                        ? {
                                            setState(() {
                                              nameController.clear();
                                              idController.clear();
                                              passwordController.clear();
                                              confpassController.clear();
                                              fnameVis = false;
                                              emailVis = false;
                                              passVis = false;
                                              cpassVis = false;
                                              istermAccept = false;
                                              loginMessage(
                                                  context,
                                                  "Account Successfully Registered",
                                                  false);
                                            })
                                          }
                                        : loginMessage(
                                            context,
                                            "Please accept our Terms & Conditions",
                                            true)
                                    : loginMessage(
                                        context,
                                        "Please fill the entries before proceeding",
                                        true),
                                child: const Text("Register",
                                    style: TextStyle(fontSize: 16))))))),
            const Divider(),
            Row(children: <Widget>[
              const Text("Already have an account"),
              const Spacer(),
              TextButton(
                onPressed: () {
                  var route =
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const LoginScreen();
                  });
                  Navigator.of(context).pop(route);
                },
                child: const Text('Login an account'),
              )
            ]),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(),
                    SignInButton(
                      Buttons.Facebook,
                      mini: true,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    SignInButton(
                      Buttons.GitHub,
                      mini: true,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    SignInButton(
                      Buttons.LinkedIn,
                      mini: true,
                      onPressed: () {},
                    ),
                    const Spacer(),
                  ]),
            )
          ],
        ),
      ),
    )));
  }
}
