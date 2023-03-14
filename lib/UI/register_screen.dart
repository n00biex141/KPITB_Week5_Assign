import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:week5_assignment/Functions/logreg_error.dart';
import 'package:week5_assignment/UI/login_screen.dart';
import 'package:week5_assignment/main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();

  final controllerName = TextEditingController();
  final controllerID = TextEditingController();
  final controllerReg = TextEditingController();
  final controllerMaj = TextEditingController();
  final controllerSem = TextEditingController();
  final controllerPass = TextEditingController();

  bool fnameVis = false, emailVis = false, passVis = false, cpassVis = false;
  bool istermAccept = false;

  bool ispassTextVis = false;
  Icon passIcon = const Icon(Icons.visibility_off);

  bool iscpassTextVis = false;
  Icon cpassIcon = const Icon(Icons.visibility_off);

  Future register() async {
    if (!istermAccept &&
        controllerPass.text.isNotEmpty &&
        controllerID.text.isNotEmpty &&
        controllerPass.text.isNotEmpty) {
      return errorMessage(context, "Please accept our Terms & Conditions!");
    } else if (controllerPass.text.isEmpty &&
        controllerID.text.isEmpty &&
        controllerPass.text.isEmpty) {
      return errorMessage(context, "Please fill the entries!");
    }

    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controllerID.text.trim(),
          password: controllerPass.text.trim());

      addUserDetails(
          controllerName.text.trim(),
          controllerReg.text.trim(),
          controllerMaj.text.trim(),
          int.parse(controllerSem.text.trim()),
          controllerID.text.trim());

      Fluttertoast.showToast(
          msg: "Successfully Registered!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } on FirebaseAuthException catch (e) {
      errorMessage(context, e.code);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future addUserDetails(
      String fname, String regno, String subject, int sem, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full name': fname,
      'reg number': regno,
      'subject': subject,
      'semester': sem,
      'email': email,
    });
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerID.dispose();
    controllerPass.dispose();
    controllerReg.dispose();
    controllerMaj.dispose();
    controllerSem.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(children: const <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 110,
                    color: Colors.blue,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("Register a new Account",
                              style: TextStyle(fontSize: 15)))),
                ])),
            TextFormField(
              validator: ((value) =>
                  value!.isEmpty ? 'Enter your proper name' : null),
              controller: controllerName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  validator: ((value) => value!.isEmpty
                      ? 'Enter your proper registration number'
                      : null),
                  controller: controllerReg,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Registration Number',
                    prefixIcon: Icon(Icons.payment_outlined),
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  validator: ((value) =>
                      value!.isEmpty ? 'Enter your proper major' : null),
                  controller: controllerMaj,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Subject / Major',
                    prefixIcon: Icon(Icons.book_outlined),
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  validator: ((value) =>
                      value!.isEmpty ? 'Enter your semester' : null),
                  controller: controllerSem,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Semester',
                    prefixIcon: Icon(Icons.numbers),
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  validator: ((value) =>
                      value != null && !EmailValidator.validate(value)
                          ? 'Enter a valid email address'
                          : null),
                  controller: controllerID,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.mail_outlined),
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                validator: ((value) =>
                    value!.isEmpty == true || value.length < 6
                        ? 'Password should have atleast 6 characters, '
                        : null),
                obscureText: !ispassTextVis,
                controller: controllerPass,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
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
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) =>
                    value!.isEmpty == true || value != controllerPass.text
                        ? 'Incorrect Password!'
                        : null),
                obscureText: !iscpassTextVis,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock_outline),
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
                                color: Colors.blueAccent,
                                onPressed: register,
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
    ))));
  }
}
