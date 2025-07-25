import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void>addstudent({
  required String Username,
  required String Email,
  required String phonenumber,
  required BuildContext context,
})async{
  try {
    await FirebaseFirestore.instance.collection("Student").add({
  "Username":Username,
  "Email":Email,
  "phonenumber":phonenumber,
});
  ScaffoldMessenger.of(context,
  ).showSnackBar(SnackBar(content:Text("Student Data Added")));
  } catch(e) {
    ScaffoldMessenger.of(
      context,
  ).showSnackBar(SnackBar(content:Text("failed")));
  }
}
Stream<QuerySnapshot>fetchstudents(){return FirebaseFirestore.instance.collection("Student").snapshots();}