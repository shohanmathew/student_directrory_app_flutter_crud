import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> addstudent({
  required String Username,
  required String Email,
  required String Phonenumber,
  required BuildContext context,
}) async {
  try {
    await FirebaseFirestore.instance.collection("Student").add({
      "Username": Username,
      "Email": Email,
      "Phonenumber": Phonenumber,
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Student Data Added")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("failed")));
  }
}

Stream<QuerySnapshot> fetchstudents() {
  return FirebaseFirestore.instance.collection("Student").snapshots();
}

Future<void> deletestudent(String id, BuildContext context) async {
  try {
    await FirebaseFirestore.instance.collection("Student").doc(id).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("deleted successfully")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

  Future<void>update(
    String id,
    String Username,
    String Email,
    String Phonenumber,
    BuildContext context,
    )async{try{await FirebaseFirestore.instance.collection("Student").doc(id).update({
      "Username": Username,
      "Email": Email,
      "Phonenumber": Phonenumber,
    });
     ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("updated succesfully")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
