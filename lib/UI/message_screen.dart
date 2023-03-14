import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:week5_assignment/Read_Data/get_user_details.dart';

// ignore: must_be_immutable
class UserMessage extends StatefulWidget {
  const UserMessage({super.key});

  @override
  State<UserMessage> createState() => _UserMessageState();
}

class _UserMessageState extends State<UserMessage> {
  final user = FirebaseAuth.instance;

  List<String> docIDs = [];

  Future<List<String>> getDocIDs() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    return snapshot.docs.map((doc) => doc.id).toList();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            user!.email!,
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: const Icon(
                  Icons.logout,
                  size: 25,
                ))
          ],
        ),
        body: SafeArea(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Expanded(
                  child: FutureBuilder<List<String>>(
                    future: getDocIDs(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(5),
                                child: ListTile(
                                  title: GetUserDetails(
                                      docID: snapshot.data![index]),
                                  tileColor: Colors.grey[100],
                                ));
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ])),
        ))));
  }
}
