import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserDetails extends StatelessWidget {
  final String docID;

  GetUserDetails({required this.docID});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(docID)
            .snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Text("Full Name: " +
                  data['full name'] +
                  "\nRegistration Number: " +
                  data['reg number']);
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
          }
          return const Text("Loading...");
        }));
  }
}
